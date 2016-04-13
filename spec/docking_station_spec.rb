require 'docking_station'
require 'bike'

describe DockingStation do
  let(:bike) { Bike.new }
    let(:ds) { DockingStation.new }
    let(:test_bikes) { ds.send(:bikes) } #To access private instance variable bikes


  it { is_expected.to respond_to(:release_bike) }
  it 'does not release a broken bike' do
      test_bikes << bike
      bike.report_status(false)

      expect { ds.release_bike }.to raise_error "It's broken" unless test_bikes.last.working
    end

  it 'releases a new bike that is also working' do
   test_bikes << bike
   (expect(ds.release_bike.class).to eq Bike)
   test_bikes << bike
   (expect(ds.release_bike.working).to eq true)
  end

  it '#returns the bike' do
  (expect(ds.dock(bike)).to eq test_bikes)
  end

  it 'expects an error when docking_station tries to instantiate a new bike if there are 0 bikes in the dock' do
      expect { ds.release_bike }.to raise_exception if test_bikes.empty?
  end

  it 'expects an error when dock tries to add a bike when subject bike_rack is greater than capacity' do
      expect { ds.dock }.to raise_exception if test_bikes.count >= subject.capacity
  end

  it 'raises an error when full' do
   subject.capacity.times { subject.dock bike }
   expect { subject.dock bike }.to raise_exception if test_bikes.count >= subject.capacity
 end

  # it 'sets the capacity of dock when the user does not want the default capacity' do
  #   expect { subject.capacity(30) }.to eq subject.capacity
  # end

  it 'makes sure capacity is set to DEFAULT_CAPACITY when no parameters are passed to DockingStation.new' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do #no 17
    it 'has a variable capacity' do
      ds.capacity.times { ds.dock bike }
      expect{ ds.dock bike }.to raise_exception "I'm all full up!"
    end

    it 'has a default capacity' do
      DockingStation::DEFAULT_CAPACITY.times { ds.dock bike }
      expect{ ds.dock bike }.to raise_exception "I'm all full up!"
    end
  end

end


#As a member of the public
#So I can return bikes I've hired
#I want to dock my bike at the docking station
