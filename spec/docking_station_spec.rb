require 'bike_container'
require 'docking_station'
require 'bike'

describe DockingStation do
  let(:bike) { double(:bike, working: true) }
  let(:ds) { DockingStation.new }
  let(:test_bikes) { ds.send(:bikes) } #To access private instance variable bikes

  it { is_expected.to respond_to(:release_bike) }

  it 'does not release a broken bike' do
    test_bikes << bike
    allow(bike).to receive(:report_status).with(false).and_return(false) #To pass with argument
    allow(bike).to receive(:working).and_return(true)
    expect { ds.release_bike }.to raise_error "It's broken" unless test_bikes.last.working
  end

  it 'releases a new bike that is also working' do
    test_bikes << bike
    (expect(ds.release_bike.working).to eq true)
  end

  it '#returns the bike' do
    (expect(ds.dock(bike)).to eq test_bikes)
  end

  it 'expects an error when docking_station tries to instantiate a new bike if there are 0 bikes in the dock' do
    expect { ds.release_bike }.to raise_exception if test_bikes.empty?
  end

end
