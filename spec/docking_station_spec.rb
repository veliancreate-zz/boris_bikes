require 'bike'

describe DockingStation do 
		let(:station){DockingStation.new(capacity: 20)}
		it "Should accept a bike" do
			bike = Bike.new
			station = DockingStation.new
			expect(station.bike_count).to eq(0)
			station.dock(bike)
			expect(station.bike_count).to eq(1)
		end

		it 'Should know when it\'s full' do
			expect(station).not_to be_full
			20.times{station.dock(Bike.new)}
			expect(station).to be_full
		end	
end