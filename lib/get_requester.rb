require 'net/http'
require 'open-uri'
require 'json'

class GetRequester
  def initialize(url)
    @url = url
  end
  #

  def get_response_body
    uri = URI.parse(@url)
    response = Net::HTTP.get_response(uri)
    response.body
  end
  def parse_json
  # we use the JSON library to parse the API response into nicely formatted JSON
    result = JSON.parse(self.get_response_body)
    result.collect do |array|
      array
    end
  end
end

get_requester = GetRequester.new('https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json')
puts get_requester.parse_json
