require_relative 'bike'
require_relative 'docking_station'
require_relative 'garage'

class Van #< Array
  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def take_broken_bikes(docking_station)
    docking_station.bikes.each do |bike|
      bikes << bike if !bike.working?
      docking_station.bikes.delete(bike)
    end
  end

  def deliver(garage)
    garage.bikes << bikes
    bikes = []
  end

end
