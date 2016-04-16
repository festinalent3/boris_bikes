require_relative 'bike_container'
require_relative 'bike'

class Van
  include BikeContainer
  def take_broken_bikes(docking_station) #If I have time: THROW ERROR IF THERE ARE NO BROKEN BIKES IN DOCK
    docking_station.bikes.each { |bike| dock(bike) if !bike.working && bikes.length < capacity }
    remove_bikes_from(docking_station)
  end

  def remove_bikes_from(place)
    place.bikes.reject! { |bike| bikes.include?(bike) }
  end

  def deliver(garage)
    garage.dock(bikes).flatten!
    remove_bikes_from(self)
  end

  def collect_working_bikes(garage)
      garage.bikes.each { |bike| dock(bike) if bike.working }
      remove_bikes_from(garage)
  end

  def return_bikes(docking_station)
    bikes.each { |bike| docking_station.dock(bike) }
    remove_bikes_from(self)
  end

end
