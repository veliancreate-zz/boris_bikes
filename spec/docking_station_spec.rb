require 'bike'

describe DockingStation do 
		let(:station){DockingStation.new(capacity: 20)}
		let(:bike){Bike.new}
		def fill_station(station)
			20.times{station.dock(Bike.new)}
		end

		it "Should accept a bike" do
			bike = Bike.new
			station = DockingStation.new
			expect(station.bike_count).to eq(0)
			station.dock(bike)
			expect(station.bike_count).to eq(1)
		end

		it 'Should know when it\'s full' do
			expect(station).not_to be_full
			fill_station station
			expect(station).to be_full
		end	

		it 'Should not accept a bike if it is full' do
			fill_station station
			expect{station.dock(bike)}.to raise_error(RuntimeError, "Station is full")
		end

		it 'Should provide the list of available bikes' do
			working_bike, broken_bike = Bike.new, Bike.new
			broken_bike.break!
			station.dock(working_bike)
			station.dock(broken_bike)
			expect(station.available_bikes).to eq([working_bike])
		end

end