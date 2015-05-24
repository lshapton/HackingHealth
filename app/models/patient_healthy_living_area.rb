class PatientHealthyLivingArea < ActiveRecord::Base
  belongs_to :healthy_living_area
  belongs_to :patient
end
