# require_relative 'bike'
# require_relative 'docking_station'
# require_relative 'garage'

class Van 
  attr_accessor :broken_bikes, :working_bikes

  def initialize
    @broken_bikes = []
    @working_bikes = []
  end

  def take_broken_bikes(docking_station)
    docking_station.bikes.each {|bike| broken_bikes << bike if !bike.working? }
    remove_bike_from_ds(docking_station)
  end

  def remove_bike_from_ds (docking_station)
    docking_station.bikes.reject! { |bike| broken_bikes.include?(bike) }
  end

  def deliver(garage)
    garage.broken_bikes.concat(broken_bikes)
    @broken_bikes = []
  end

  def collect_working_bikes(garage)
    @working_bikes.concat(garage.working_bikes)
  end

  def return_bikes(docking_station)
    working_bikes.each do |bike|
      docking_station.dock(bike)
      working_bikes.delete(bike)
    end
  end

end
