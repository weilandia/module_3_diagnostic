class FuelStationsRepo
  attr_reader :stations
  def initialize(location)
    @stations = build_stations(location)
  end

  def build_stations(location)
    NRELService.new(location).nearest_stations["fuel_stations"].map do |station|
      FuelStation.new(station)
    end
  end

  def scope_elec_and_prop(distance = 6)
    stations.select { |station| station.fuel_type == "ELEC" || station.fuel_type == "PROP" && station.distance < 6 }
  end
end
