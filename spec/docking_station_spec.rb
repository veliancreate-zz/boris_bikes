require 'docking_station'

describe DockingStation do
	let (:bike)        { double :bike, break!: true, broken?: false }
	let (:broken_bike) { double :bike, break!: true, broken?: true  }
	let (:station)     { DockingStation.new(capacity: 20)           }

	def fill_station(station)
		20.times {station.dock(bike)}
	end

	def empty_station(station)
		station.bike_count.times {station.release(bike)}
	end
	
	it "should accept a bike" do
		expect(station.bike_count).to eq(0)
		station.dock(bike)
		expect(station.bike_count).to eq(1)
	end

	it "should release a bike" do
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq(0)
	end

	it "should know when it's full" do
		expect(station).not_to be_full
		fill_station station
		expect(station).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_station station
		expect{ station.dock(bike) }.to raise_error(RuntimeError, 'Station is full')
	end

	it "should provide the list of available bikes" do
		broken_bike.break!
		station.dock(bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq([bike])
	end

 	it "should know when its empty" do
 		expect(station).to be_empty
 	end

 	it "should not release a bike that is not there" do
 		empty_station station
 		expect{ station.release(bike) }.to raise_error(RuntimeError, 'No bikes available')
 	end

end