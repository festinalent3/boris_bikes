class Garage
  attr_accessor :bikes

  def initialize
    @bikes
  end

  def fix
    bikes.each do |bike|
      bike.report_status(true)
    end
  end
end
