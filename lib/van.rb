require_relative "bike"
require_relative "docking_station"

class Van < Array


  def take(bike)
    #bike = ds.bikes.pop
  #ds.bikes.each do |bike|
    self << bike if !bike.working?
  #  deliver(bike) if !bike.working?
  end

  def deliver(bike)
    #put into garage
  end

end
