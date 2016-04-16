# require_relative 'bike'
require_relative 'bike_container'


class DockingStation
  include BikeContainer

  def release_bike
    raise 'Piss off!' if empty?
    raise "It's broken" unless bikes.last.working
    bikes.pop
  end

end
