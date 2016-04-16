require 'bike_container'
require 'van'

describe Van do
	let(:working_bike) { double(:working_bike, working: true) }
	let(:broken_bike) { double(:broken_bike, working: false) }
	let(:garage) { double(:garage) }
	let(:ds) { double(:ds) }

	it 'takes broken bikes from the docking station' do
		allow(ds).to receive(:bikes).and_return([broken_bike, working_bike, broken_bike])
		subject.take_broken_bikes(ds)
		expect(subject.bikes).to eq([broken_bike, broken_bike])
	end

	it 'delivers (broken) bikes to garage' do
		allow(garage).to receive(:dock).with([broken_bike, broken_bike]).and_return([broken_bike, broken_bike])
		subject.bikes = [broken_bike, broken_bike]
		subject.deliver(garage)
		expect(subject.bikes).to eq([])
	end

	it 'collects working bikes from a garage' do
		allow(garage).to receive(:bikes).and_return([working_bike, working_bike, working_bike])
		subject.collect_working_bikes(garage)
		expect(subject.bikes).to eq [working_bike, working_bike, working_bike]
	end

	it 'returns bikes to a docking_station' do
		subject.bikes = [working_bike, working_bike]
		allow(ds).to receive(:dock).with(working_bike).and_return([working_bike])
		subject.return_bikes(ds)
		expect(subject.bikes).to eq([])
	end

end
