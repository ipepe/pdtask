ENV['RAILS_ENV'] ||= 'test'
ENV['PIPELINE_DEALS_API_KEY'] = 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  def before_setup
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get '/api/v3/deals.json?api_key=test',
               {},
               File.read(Rails.root.join('test', 'fixtures', 'files', 'deals.json')),
               200
    end
    super
  end
  # Add more helper methods to be used by all tests here...
end
