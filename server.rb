require 'sinatra/base'
require 'net/http'
require 'json'

class GitHubLanguage < Sinatra::Base

  require_relative './helpers/language_helper'

  include LanguageHelper


  get '/' do
    erb :index
  end

  post '/*' do
    @user = params[:username]
    @language = get_favourite_language_of @user
    erb :index
  end

end