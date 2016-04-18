class NRELService
  def initialize(location)
    @_connection = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/")
    @params = { location: location, api_key: "PjkstXP13Vy9JFdaC6SbHs73S5K5ASvy6YYghyGR" }
    require "pry"; binding.pry
  end

  def get(path)
    parse(connection.get(path, @params))
  end

  def nearest_stations
    get("nearest.json")
  end

  private
    def parse(response)
      JSON.parse(response.body, symbolize_name: true)
    end

    def connection
      @_connection
    end
end
