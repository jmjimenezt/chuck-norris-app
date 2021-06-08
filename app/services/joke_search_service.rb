require 'chuck_norris_client'

# Search for jokes
class JokeSearchService

  def initialize
    @client = ChuckNorrisClient.new
  end

  def call(options = {})
    @jokes = []

    result = @client.search(options)
    json = JSON.parse(result.response.body)
    
    if !json.nil?
        total = json["total"].to_i
        result = json["result"]

        result.each do |joke|
            @jokes.push(joke)
        end
    else
        puts "TODO: Handle errors!"
    end
  end

end
