require 'active_support/time'
require 'awesome_print'
require 'correios-cep'
require 'cucumber'
require 'date'
require 'dotenv/load'
require 'factory_bot'
require 'faker'
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require 'mongo'
require 'pry'
require 'pry-nav'
require 'pry-remote'
require 'report_builder'
require 'rspec'
require 'json_matchers/rspec'

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/environments/#{ENV['ENV_TYPE']}.yml"))

JsonMatchers.schema_root = File.join(Dir.pwd, 'features/support/data/schemas')

World(FactoryBot::Syntax::Methods)

Correios::CEP.configure do |config|
  config.request_timeout = 3
end
