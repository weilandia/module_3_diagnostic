class FuelStation
  attr_reader :fuel_type, :distance, :name, :address, :access_times
  def initialize(station)
    @fuel_type = station["fuel_type_code"]
    @distance = station["distance"]
    @name = station["station_name"]
    @address = build_address(station)
    @access_times = station["access_days_time"]
  end

  def build_address(station)
    station["street_address"] + ", " + station["city"] + " " + station["state"] + " " + station["zip"]
  end
end
