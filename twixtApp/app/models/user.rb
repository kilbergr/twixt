class User < ActiveRecord::Base
	has_secure_password
	
	validates :password, presence: true
	validates :first_name, presence: true
	validates :email, presence: true, uniqueness: true

	has_many :associations, dependent: :destroy
	has_many :groups, through: :associations

	def generate_password_reset_token!
		update(password_reset_token: SecureRandom.urlsafe_base64(48))
	end

end

