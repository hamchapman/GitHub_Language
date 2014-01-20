require_relative './spec_helper'
require_relative '../helpers/language_helper'

describe GitHubLanguage do

  include LanguageHelper

  context 'when a username has been provided' do

    it 'receives a response containing langauge data from the GitHub API', :vcr do
      user = "hamchapman"
      uri = "https://api.github.com/users/#{user}/repos"
      response = get_response_from uri
      expect(response.code).to eq "200"
      expect(response.body).to include '"language":"Ruby"'
    end

    it 'receives an error when an invlid username is provided', :vcr do
      user = "hamchapman777"
      uri = "https://api.github.com/users/#{user}/repos"
      response = get_response_from(uri)
      expect(response.code).to eq "404"
      expect(response.message).to eq "Not Found"
    end

    it 'can create an array of a user\'s used languages', :vcr do
      user = "hamchapman"
      uri = "https://api.github.com/users/#{user}/repos"
      user_repos = get_repos uri
      expect(get_array_of_languages user_repos ).to include("CSS", "JavaScript", "Objective-C", "Ruby", "Shell")
    end

  end
end