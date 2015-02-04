require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 
	let(:bike) { double :bike, break!: true, broken?: false, is_a?: "i'm a bike"}
	let(:broken_bike) { double :bike, break!: true, broken?: true }
	let(:holder){ContainerHolder.new}
	let(:other) { double :other}

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
  		expect{holder.dock(bike)}.to raise_error(RuntimeError, 'Station is full')
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

	it 'should not release a bike that is not there' do 
		holder.bike_count.times{holder.release(bike)}
		expect{holder.release(bike)}.to raise_error(RuntimeError, 'No bikes available')
	end	

	it 'should not accept an empty argument' do 
		expect{holder.release(nil)}.to raise_error(RuntimeError, 'No argument passed')
	end	

	it 'should not accept an argument that is not a bike' do
		dock_bike(bike)
		expect{holder.release(other)}. to raise_error(RuntimeError, 'I only release bikes')
	end
end

