require 'bike_container'
require 'garage'

describe Garage do
  let(:broken_bike) { double(:broken_bike, working?: false) }
  let(:working_bike) { double(:working_bike, working?: true) }

  it 'fixes broken bikes' do
    subject.bikes = [broken_bike, broken_bike]
    allow(broken_bike).to receive(:report_status).with(true) do
      index = subject.bikes.index(broken_bike)
      subject.bikes[index]= working_bike
    end
    subject.fix_bikes
    expect(subject.bikes).to eq([working_bike, working_bike])
  end

end
