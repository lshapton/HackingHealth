class Goal < ActiveRecord::Base
  belongs_to :patient
  has_many :comments

  validates :medical_condition_id, :presence => true
end
