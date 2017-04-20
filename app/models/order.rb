class Order < ApplicationRecord
	belongs_to :circle
	before_save :default_values
	def default_values
		self.acceptUserName ||= '-1'
	end
end