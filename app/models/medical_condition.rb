class MedicalCondition < ActiveRecord::Base
	has_many :patient_medical_conditions, :dependent => :destroy
	has_many :patients, through: :patient_medical_conditions
end
