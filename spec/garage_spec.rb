require './lib/garage'

#class ContainerHolder; include BikeContainer; end

	describe Garage do
	
		let(:bike) {Bike.new}
		let(:broken_bike) {Bike.new.break!}
		let(:garage) {Garage.new}

		it 'should accept the bike' do
			expect(garage.bike_count).to eq(0)
			garage.dock(bike)
			expect(garage.bike_count).to eq(1)
		end

		it 'should repair the bike' do
			expect(broken_bike.broken?).to be true
			garage.accept(broken_bike)
			expect(bike.broken?).to be false
		end

	end
