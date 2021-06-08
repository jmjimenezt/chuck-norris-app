
class ChuckNorrisClient
  include HTTParty
  base_uri 'api.chucknorris.io/jokes'

  def initialize()
  end

  def search(options = {})
    self.class.get("/search", options)
  end

  def random(options = {})
    self.class.get("/random", options)
  end

  def categories
    self.class.get("/categories")
  end
end
