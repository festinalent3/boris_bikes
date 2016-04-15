class Bike
  attr_accessor :working

  def initialize(working = true)
    @working = working
  end

  def report_status(status)
    @working = status
  end

end
