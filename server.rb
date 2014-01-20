require 'sinatra/base'
require 'net/http'
require 'json'

class GitHubLanguage < Sinatra::Base

  require_relative './helpers/language_helper'
  require_relative './controllers/application'
  include LanguageHelper

end