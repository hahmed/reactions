require File.expand_path('../../config/environment', __FILE__)

require 'simplecov'
SimpleCov.start('rails')
require 'coveralls'
Coveralls.wear!('rails')

require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
