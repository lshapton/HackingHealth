class Patient < ActiveRecord::Base
	has_many :goals
	has_many :patient_medical_conditions, :dependent => :destroy
	has_many :medical_conditions, through: :patient_medical_conditions
	has_many :patient_healthy_living_areas, :dependent => :destroy
	has_many :healthy_living_areas, through: :patient_healthy_living_areas


	def name
		"#{self.preferred_name} #{self.surname}"
	end

	def age
		((Date.today - dob) / 365).floor
	end

	def is_a_smoker?
		if self.smoker === true
			"Yes"
		else
			"No"
		end
	end

end
