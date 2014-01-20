require_relative './spec_helper'

describe GitHubLanguage do

  context 'when a username has been provided' do

    it 'receives a response containing langauge data from the GitHub API', :vcr do
      user = "hamchapman"
      uri = "https://api.github.com/users/#{user}/repos"
      response = get_response_from(uri)
      expect(response.code).to eq "200"
      expect(response.body).to include '"language":"Ruby"'
    end

  end
end