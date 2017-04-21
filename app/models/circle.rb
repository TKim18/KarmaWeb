class Circle < ApplicationRecord
	has_many :orders
	
	def self.getCircle(name)
		matchingCircles = Circle.where("name = ?", name)
		return matchingCircles
	end
end
