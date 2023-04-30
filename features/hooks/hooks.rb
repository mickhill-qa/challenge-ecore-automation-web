# frozen_string_literal: true

### Global ###
# Before do
# end

After do |scenario|
  scenario_name = scenario.name.gsub(/[^\w\-]/, '_')
  screenshot_name("ERRO_#{scenario_name.downcase!}") if scenario.failed?
end

### Tag ###
# Before '@myTag' do
# end

# After '@myTag' do
# end
