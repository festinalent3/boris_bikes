require_relative "bike"

class DockingStation
  DEFAULT_CAPACITY = 20


  attr_accessor :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    raise 'Docking station full' if full?
    bikes << bike
    bikes.last
  end

  def release_bike
    raise 'No bikes available' if empty?
    bikes.last
  end


  private
  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end

end