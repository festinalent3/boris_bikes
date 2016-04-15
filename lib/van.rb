require_relative 'bike'
require_relative 'docking_station'
require_relative 'garage'

class Van #< Array
  attr_accessor :van_bikes

  def initialize
    @van_bikes = []
  end

  def take_broken_bikes(docking_station)
    docking_station.bikes.each {|bike| van_bikes << bike if !bike.working? }
    remove_bike_from_ds(docking_station)
  end

  def remove_bike_from_ds (docking_station)
    docking_station.bikes.reject! { |bike| van_bikes.include?(bike) }
      #docking_station.bikes.delete(van_bikes)
  end

  def deliver(garage)
    garage.bikes << van_bikes
    van_bikes = []
  end

end
