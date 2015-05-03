class Comment < ActiveRecord::Base
  belongs_to :healthcare_professional
  belongs_to :goal
end
