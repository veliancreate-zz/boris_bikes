require './lib/garage'

class ContainerHolder; include BikeContainer; end

	describe Garage do
	
		let(:bike) {Bike.new}
		let(:holder) {ContainerHolder.new}

		it 'should accept the bike' do
			expect(holder.bike_count).to eq(0)
			holder.dock(bike)
			expect(holder.bike_count).to eq(1)
		end

		it 'should repair the bike' do
			expect(bike.fix!).not_to be_broken
		end

	end