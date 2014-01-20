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
  
  def calculate_favourite languages
    counter = Hash.new(0)
    languages.each { |i| counter[i] += 1 }
    favourite_languages = []
    counter.each { |k, v| favourite_languages << k if v == counter.values.max }
    favourite_languages.join(", ")
  end
  
end