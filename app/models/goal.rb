class Goal < ActiveRecord::Base
  belongs_to :patient
  has_many :comments
end
