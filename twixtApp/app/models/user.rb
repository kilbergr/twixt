class User < ActiveRecord::Base
	has_secure_password
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true
	validates :first_name, presence: true
	
	has_many :associations, dependent: :destroy
	has_many :groups, through: :associations
end

