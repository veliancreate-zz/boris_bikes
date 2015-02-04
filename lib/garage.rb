require_relative 'bike_container'

class Garage

	include BikeContainer

		DEFAULT_CAPACITY = 10

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	end

		def accept(bike)
		bike.fix!
		dock(bike)
	end

end
