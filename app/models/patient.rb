class Patient < ActiveRecord::Base
	has_many :goals
	has_many :patient_medical_conditions, :dependent => :destroy
	has_many :medical_conditions, through: :patient_medical_conditions
	has_many :patient_healthy_living_areas, :dependent => :destroy
	has_many :healthy_living_areas, through: :patient_healthy_living_areas
	has_one :user
	accepts_nested_attributes_for :user



	def name
		"#{self.preferred_name} #{self.surname}"
	end


end
