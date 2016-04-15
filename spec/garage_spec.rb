require 'garage'

describe Garage do
  let(:broken_bike) { double(:broken_bike, working?: false) }
	let(:working_bike) { double(:working_bike, working?: true) }

  it 'stores broken bikes' do
    subject.store_broken_bikes([broken_bike, broken_bike])
    expect(subject.broken_bikes).to eq [broken_bike, broken_bike]
  end

  it 'fixes broken bikes' do
    allow(broken_bike).to receive(:report_status).with(true).and_return(working_bike)
    subject.broken_bikes = [broken_bike, broken_bike]
    subject.fix_bikes
    (expect(subject.working_bikes).to eq([working_bike, working_bike])) && (expect(subject.broken_bikes).to eq([]))
  end

end
