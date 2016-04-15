require 'van'

describe Van do
	let(:working_bike) { double(:working_bike, working?: true) }
	let(:broken_bike) { double(:broken_bike, working?: false) }
	let(:garage) { double(:garage) }
	let(:ds) { double(:ds) }

	it 'takes broken bikes from the docking station' do
		allow(ds).to receive(:bikes).and_return([broken_bike, working_bike, broken_bike])
		subject.take_broken_bikes(ds)
		expect(subject.broken_bikes).to eq([broken_bike, broken_bike])
	end

	it 'delivers (broken) bikes to garage' do
		allow(garage).to receive(:broken_bikes).and_return([])
		subject.broken_bikes = [broken_bike, broken_bike]
		subject.deliver(garage)
		expect(subject.broken_bikes).to eq([])
	end

	it 'collects working bikes from a garage' do
		allow(garage).to receive(:working_bikes).and_return([working_bike, working_bike, working_bike])
		subject.collect_working_bikes(garage)
		expect(subject.working_bikes).to eq [working_bike, working_bike, working_bike]
	end

	it 'returns bikes to a docking_station' do
		subject.working_bikes = [working_bike, working_bike]
		allow(ds).to receive(:dock).with(working_bike).and_return([working_bike])
		subject.return_bikes(ds)
		expect(subject.working_bikes).to eq([])
	end

end
