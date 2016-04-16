require 'bike_container'
require 'docking_station'
require 'van'
require 'garage'

shared_examples_for "a bike container" do
  let(:bike_container) { described_class.new() }
  let(:bike) { double(:bike, working:true) }
  let(:test_bikes) { bike_container.send(:bikes) }

  describe 'initialization' do
    context "initialized with maximum capacity of 20 bikes" do
      it "says it has maximum capacity of 20 bikes" do
        bike_container.capacity.should eq(20)
      end

      it 'makes sure capacity is set to DEFAULT_CAPACITY when no parameters are passed to DockingStation.new' do
        expect(bike_container.capacity).to eq BikeContainer::DEFAULT_CAPACITY
      end

      it 'has a variable capacity' do
        bike_container.capacity.times { bike_container.dock bike }
        expect{ bike_container.dock bike }.to raise_exception "I'm all full up!"
      end

    end
    context "initialized with an empty bike rack" do
      it "says it has a bike rack that is empty" do
        bike_container.bikes.should eq([])
      end
    end
  end

  describe '#dock' do
    context "it can dock a bike that is either working or not working" do
      it "returns true" do
        bike_container.dock(bike)
        bike_container.bikes.include?(bike).should eq(true)
      end
      it 'raises an error when full' do
        bike_container.capacity.times { subject.dock bike }
        expect { bike_container.dock bike }.to raise_exception if test_bikes.count >= subject.capacity
      end
    end
  end

  describe DockingStation do
    it_behaves_like "a bike container"
  end

  describe Van do
    it_behaves_like "a bike container"
  end

  describe Garage do
    it_behaves_like "a bike container"
  end

end
