Given /^chef server has (.*)$/ do |resources_name|
  stub_request(:get, "http://groupinator.com:4000/#{resources_name}/").
    to_return(:body => fixture_file("#{resources_name}.json"))
end
