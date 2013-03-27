require 'spork'
Spork.prefork do
	ENV["RAILS_ENV"] ||= 'test'
	require File.expand_path("../../config/environment", __FILE__)
	require 'rspec/rails'
	Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
	RSpec.configure do |config|
	  # uncomment the appropriate line:
	  # config.mock_with :mocha
	  # config.mock_with :flexmock
	  # config.mock_with :rr
	  config.mock_with :rspec
	  config.fixture_path = "#{::Rails.root}/spec/fixtures"
	  config.use_transactional_fixtures = true
	end
end

Spork.each_run do
end

