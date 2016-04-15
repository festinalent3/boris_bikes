class Garage
  attr_accessor :broken_bikes, :working_bikes

  def initialize
    @broken_bikes = []
    @working_bikes = []
  end

  def store_broken_bikes(van_bikes)
    @broken_bikes = van_bikes
  end

  def fix_bikes
    broken_bikes.each do |bike|
      @working_bikes << bike.report_status(true)
    end
    @broken_bikes =[]
  end
end
