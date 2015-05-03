class Patient < ActiveRecord::Base
	has_many :goals

	def name
		"#{self.preferred_name} #{self.surname}"
	end
end
