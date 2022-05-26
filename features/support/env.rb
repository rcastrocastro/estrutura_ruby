require 'active_support/time'
require 'awesome_print'
require 'correios-cep'
require 'cucumber'
require 'date'
require 'dotenv/load'
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

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/environments/#{ENV['ENV_TYPE']}.yml"))
QUERY_MONGO = YAML.load_file('features/support/libs/query_mongo.yml')

Correios::CEP.configure do |config|
  config.request_timeout = 3
end
