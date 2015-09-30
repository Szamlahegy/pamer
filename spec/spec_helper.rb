ENV['RAILS_ENV'] ||= 'test'
require File.expand_path("../../test/dummy/config/environment.rb",  __FILE__)
#require 'rails/all'
#require 'rails/all'
require 'rspec/rails'
require 'factory_girl_rails'
#require 'rspec/autorun'
#Rails.backtrace_cleaner.remove_silencers!
# Load support files
#Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
#config.before(:all) do
#  FactoryGirl.reload
#end

RSpec.configure do |config|
  FactoryGirl.definition_file_paths = [File.expand_path('./factories', __FILE__)]
  FactoryGirl.find_definitions
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.include FactoryGirl::Syntax::Methods
end
