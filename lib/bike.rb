class Bike


  def initialize
    @working = true
  end

  def working?
    @working
  end

  def report(value = true)
    @working = value
  end

end