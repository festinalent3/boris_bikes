require_relative 'bike'

module BikeContainer
  attr_accessor :capacity, :bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  # def release_working_bike
  #   raise 'Piss off!' if empty?
  #   raise "It's broken" unless bikes.last.working
  #   bikes.pop
  # end

  def dock(bike)
    raise "I'm all full up!" if full?
    bikes << bike
  end

  private

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

end
