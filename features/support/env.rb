# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'site_prism/all_there'
require 'report_builder'
require 'json'
require 'aws-sdk-secretsmanager'
require 'base64'

## Global
World Capybara::DSL
World Capybara::RSpecMatchers

## Environment Settings
# chosen in the cucumber.yml file
# prod, dev, qa
SELECTED_ENV = ENV['ENV']
if SELECTED_ENV.blank?
  raise "\nENV constant is empty." \
        "\nPlease specify Environment: (prod, dev, qa)." \
        "\nEx.:" \
        "\n  $ cucumber ENV=qa" \
        "\n    or" \
        "\n  $ cucumber -p qa" \
        "\n\n"
end

## Web Browser Settings
# chosen in the cucumber.yml file
# chrome, chrome_headless
SELECTED_BROWSER = ENV['BROWSER']
case SELECTED_BROWSER
when nil
  raise "\nBROWSER constant is empty." \
        "\nPlease specify Web Browser: (chrome, chrome_headless, firefox ou firefox_headless)." \
        "\nEx.:" \
        "\n  $ cucumber BROWSER=chrome_headless" \
        "\n    or" \
        "\n  $ cucumber -p chrome_headless" \
        "\n\n"
when 'chrome'
  Capybara.register_driver :selenium_chrome do |app|
    Capybara::Selenium::Driver.load_selenium
    browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
      opts.args << '--lang=pt-BR'
      opts.args << '--disable-site-isolation-trials'
      opts.args << '--start-maximized'
      opts.args << '--incognito'
      opts.args << '--disable-dev-shm-usage'
    end
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: browser_options
    )
  end
  @driver = :selenium_chrome
when 'chrome_headless'
  Capybara.register_driver :selenium_chrome_headless do |app|
    Capybara::Selenium::Driver.load_selenium
    browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
      opts.args << '--lang=pt-BR'
      opts.args << '--headless'
      opts.args << '--disable-gpu' if Gem.win_platform?
      opts.args << '--no-sandbox'
      opts.args << '--incognito'
      opts.args << '--window-size=1366x768'
      opts.args << '--disable-site-isolation-trials'
      opts.args << '--disable-dev-shm-usage'
    end
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: browser_options
    )
  end
  @driver = :selenium_chrome_headless
when 'firefox'
  @driver = :selenium
when 'firefox_headless'
  Capybara.register_driver :selenium_firefox_headless do |app|
    browser_options = ::Selenium::WebDriver::Firefox::Options.new.tap do |opts|
      opts.args << '--headless'
      opts.args << '--window-size=1366,768'
    end
    Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      options: browser_options
    )
  end
  @driver = :selenium_firefox_headless
end

## Defaults
ENVIRONMENT     = YAML.load_file("#{File.dirname(__FILE__)}/config/environments.yml")[SELECTED_ENV]
BASE_URL        = (!ENV['URL'].nil? ? ENV['URL'] : ENVIRONMENT['base_url'])
SCREENSHOT_PATH = 'reports/screenshots/'
REPORT_PATH     = 'reports/report-builder/'

## BASE_URL check
if BASE_URL.blank? || BASE_URL.eql?('/')
  raise "\nBASE_URL constant is empty." \
        "\nPlease specify the 'base_url' in the Environment file: (prod, dev, qa)." \
        "\nEx.:" \
        "\n  features/support/config/environments.yml" \
        "\n    or in execution" \
        "\n  $ cucumber URL=http://environment-url.test" \
        "\n\n"
end

## Loading Helpers
Dir[File.join(
  File.dirname(__FILE__), '/helpers/*.rb'
)
].each do |file|
  require_relative file
end

## Loading Pages
Dir[File.join(
  File.dirname(__FILE__), '/pages/*.rb'
)].sort.each do |file|
  require file
end

## Test execution
Capybara.configure do |config|
  config.default_driver = @driver   ## Variables for definition the web Browser
  config.default_max_wait_time = 5  ## overall waiting time
  config.app_host = BASE_URL
end
