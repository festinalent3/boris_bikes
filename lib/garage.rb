require_relative 'bike_container'
require_relative 'bike'

class Garage
  include BikeContainer

  def store_broken_bikes(van_bikes)
    #@bikes.concat(van_bikes)
    dock(van_bikes).flatten! #DOESEN'T work???? see if line 22 in van fixed it maybe we donät need this method
  end

  def fix_bikes
    @bikes.each do |bike|
      bike.report_status(true)
    end
  end
end
