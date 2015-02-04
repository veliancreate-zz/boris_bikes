require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 
	let(:bike) { double :bike, break!: true, broken?: false}
	let(:broken_bike) { double :bike, break!: true, broken?: true }
	let(:holder){ContainerHolder.new}

	def fill_holder(holder)
		10.times{holder.dock(bike)}
	end	

	def dock_bike(bike)
		holder.dock(bike)
	end	

	it 'should accept a bike' do 
		expect(holder.bike_count).to eq(0)
		dock_bike(bike)
		expect(holder.bike_count).to eq(1)
	end	

	it "should release a bike" do
		dock_bike(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)

	end
	
	it "should know when it's full" do
		expect(holder).not_to be_full
		fill_holder(holder)
  		expect(holder).to be_full
	end

	it 'should not accept a bike if it\'s full' do
  		fill_holder(holder)
  		expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError, 'Station is full')
	end

	it "should provide the list of available bikes" do
		broken_bike.break!
		dock_bike(bike)
		dock_bike(broken_bike)
		expect(holder.available_bikes).to eq([bike])
	end

	it 'should know when it\'s empty' do 
		expect(holder).to be_empty
	end



end

