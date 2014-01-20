require 'json'

module LanguageHelper

  def get_response_from uri
    Net::HTTP.get_response(URI(uri))
  end

  def parse_response response
    JSON.parse(response.body)
  end

  def get_repos uri
    response = get_response_from uri
    return parse_response response if !response.message.include? "Not Found"
    false
  end

  def get_array_of_languages repos
    languages = repos.map {|repo| repo['language'] }
    languages.delete_if { |lang| lang.nil? }
  end

end