require 'bundler/setup'
Bundler.setup

require 'active_record'
require 'factory_girl'

RSpec.configure do |config|
  # some (optional) config here
  config.include FactoryGirl::Syntax::Methods
  FactoryGirl.find_definitions
end