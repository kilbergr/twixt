class User < ActiveRecord::Base
	has_secure_password
	
	validates :password, presence: true
	validates :first_name, presence: true
	validates :email, presence: true, uniqueness: true

	has_many :associations, dependent: :destroy
	has_many :groups, through: :associations
end

