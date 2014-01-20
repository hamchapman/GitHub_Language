class GitHubLanguage < Sinatra::Base
  
  get '/' do
    erb :index
  end

  post '/*' do
    @user = params[:username]
    @language = get_favourite_language_of @user
    erb :index
  end
  
end