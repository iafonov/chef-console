Given /^I debug$/ do
  debugger
  true
end

When /^I wait for (\d+) seconds?$/ do |secs|
  sleep secs.to_i
end