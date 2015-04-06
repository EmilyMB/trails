class TrailsService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://outdoor-data-api.herokuapp.com/api")
  end

  def get_all_trails
    data = parse(connection.get do |req|
      req.params["api_key"] = ENV["trails_api_key"]
      req.params["format"] = "json"
      req.params["country"] = "United States"
      req.params["limit"] = 10
    end)

    TrailGenerator.save_trails(data)
  end

  private

  def parse(response)
    JSON.parse(response.body)["places"]
  end
end
