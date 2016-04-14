require_relative "bike"
require_relative "van"

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_accessor :bikes, :capacity #:van

  def initialize(capacity = DEFAULT_CAPACITY, van = Van.new)
    @bikes = []
    @capacity = capacity
    @van = van
    #@van = Van.new
  end

  def dock(bike)
    raise 'Docking station full' if full?
    bikes << bike
    #van.take(bike) if !working?

    bikes.last
  end

  def release_bike
    raise 'No bikes available' if empty?
    raise 'Bike not working' unless bikes.last.working?
    bikes.pop
  end


  private
  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end

end
