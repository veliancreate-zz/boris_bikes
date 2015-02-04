require_relative 'bike_container'

class Garage

	include BikeContainer

	DEFAULT_CAPACITY = 10

	def initialize(options = {})
   		self.capacity = options.fetch(:capacity, capacity)
 	end

	def accept(bike)
		bike.fix!
		dock(bike)
	end

	
end
