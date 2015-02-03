
class Bike
	
	def initialize
		fix!
	end	
	
	def broken? 
		@broken
	end	
	
	def break!
		@broken = true
		self
	end	

	def fix!
		@broken = false
		self
	end

end

class DockingStation
	
	def initialize
		@bikes = []
	end

	def bike_count
		@bikes.count
	end
	
	def dock(bike)
		@bikes << bike
	end
end