require 'json'

module LanguageHelper

  def get_response_from uri
    Net::HTTP.get_response(URI(uri))
  end

end