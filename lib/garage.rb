require_relative 'bike_container'
require_relative 'bike'

class Garage
  include BikeContainer

  def fix_bikes
    @bikes.each do |bike|
      bike.report_status(true)
    end
  end
end
