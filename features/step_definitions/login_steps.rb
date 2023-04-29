# frozen_string_literal: true

# @login_baseflow
Given('the main page loaded') do
  @page_login = LoginPage.new
  @page_login.load
  expect(page.current_url).to eql(@page_login.url)
  screenshot
end

When('the following field Email: {string}') do |email|
  @page_login.fill_in_username email
end

And('the following field Password: {string}') do |password|
  @page_login.fill_inpassword password
end

And('the click the button Login') do
  screenshot
  @page_login.click_btn_login
end

Then('the application show the page Invoice List') do
  @page_invoice_list = InvoiceListPage.new
  expect(page.current_url).to eql(@page_invoice_list.url)
  expect('Invoice List').to eql(@page_invoice_list.get_page_title)
  screenshot
end
