require 'van'

describe Van do
	let(:working_bike) { double(:bike, working?: true) } # dependency
	let(:broken_bike) { double(:bike, working?: false) } # dependency
	let(:garage) { double(:garage) }
	let(:ds) { double(:ds) }

	it { is_expected.to respond_to(:take_broken_bikes) }
	it { is_expected.to respond_to(:deliver) }

	it 'takes broken bikes from the docking station' do
		allow(ds).to receive(:bikes).and_return([broken_bike, working_bike, broken_bike])
		subject.take_broken_bikes(ds)
		expect((subject.van_bikes.length) == 2)
	end

	it 'delivers broken bikes to garage' do
		allow(garage).to receive(:bikes).and_return([])
		subject.deliver(garage)
		expect(subject.van_bikes).to eq([])
	end
end


# allow(bikes).to receive(:each).and_return([bike, bike, bike])
#subject.take([broken_bike, working_bike, broken_bike])
