class HealthyLivingArea < ActiveRecord::Base
	has_many :patient_healthy_living_areas, :dependent => :destroy
	has_many :patients, through: :patient_healthy_living_areas
end
