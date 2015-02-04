
module BikeContainer

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		raise 'Station is full' if full?
		bikes<<bike
	end

	def release(bike)
		if bike.is_a? Bike
			raise 'No bikes available' if empty?
			bikes.delete(bike)
		elsif bike==nil
			raise 'No argument passed'
		else
			raise 'I only release bikes'
		end
		
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def empty?
		bike_count == 0
	end	

end	
