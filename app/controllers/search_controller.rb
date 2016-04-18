class SearchController < ApplicationController
  def index
    require "pry"; binding.pry
    @locations = NRELService.new(params[:location])
  end
end

# https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80211&api_key=PjkstXP13Vy9JFdaC6SbHs73S5K5ASvy6YYghyGR
