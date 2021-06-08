require 'chuck_norris_client'

# Gets a random joke
class RandomJokeService

  def initialize
    @client = ChuckNorrisClient.new
  end

  def call
    @jokes = []
    result = @client.random
    json = JSON.parse(result.response.body)
    @jokes.push(json) if !json.nil?
  end
end
