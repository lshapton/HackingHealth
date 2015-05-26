class HealthcareProfessional < ActiveRecord::Base
	has_many :hcp_patient_ids

	accepts_nested_attributes_for :hcp_patient_ids
end
