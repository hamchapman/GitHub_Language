ENV["RACK_ENV"] = 'test'
require './server'
require 'json'
require 'capybara'
require 'vcr'
require 'rack/test'

def app
  GitHubLanguage
end

Capybara.app = Sinatra::Application

VCR.configure do |c|
  c.ignore_localhost = true
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
end

RSpec.configure do |config|
  config.around(:each, :vcr) do |example|
    name = example.metadata[:full_description].split(/\s+/, 2).join("/").gsub(/[^\w\/]+/, "_")
    VCR.use_cassette(name, { :allow_playback_repeats => true, :match_requests_on => [:uri] }) { example.call }
  end
  
  config.include Rack::Test::Methods
  config.include Capybara::DSL

  config.order = 'random'
end