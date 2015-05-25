class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ROLES = %w[patient health_care_professional]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
