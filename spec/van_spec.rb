require 'van'

describe Van do
	let(:bike) { double(:bike, working?: false) } # dependency
	let(:ds) { double(:ds) }
	#let(:bikes) { [] } # OK!

	it { is_expected.to respond_to(:take) }
	it { is_expected.to respond_to(:deliver) }

	it 'takes broken bikes from the docking station' do
		#bikes << bike
		# ds = Array.new
		# 3.times do
		# 	ds << bike
		# end

   	#allow(ds).to receive(:bikes).and_return(bike)
		#3.times do |b|
		subject.take(bike)
		#end
		#expect(subject.take(bike)) unless bike.working?
		expect((subject.length) == 1) #unless bike.working?
		end

end





# van.take(bike)
# NameError: undefined local variable or method `van' for main:Object
# 	from (irb):8
# 	from /Users/emmasjostrom/.rvm/rubies/ruby-2.2.1/bin/irb:11:in `<main>'
# 2.2.1 :009 > van.deliver(bikes)
# NameError: undefined local variable or method `van' for main:Object
# 	from (irb):9
# 	from /Users/emmasjostrom/.rvm/rubies/ruby-2.2.1/bin/irb:11:in `<main>'
# 2.2.1 :010 > class Garage
# 2.2.1 :011?>   end
#  => nil
# 2.2.1 :012 >
