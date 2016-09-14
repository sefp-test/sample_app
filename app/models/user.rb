class User < ActiveRecord::Base

	# Turn to downcase before save
	before_save { email.downcase! }

	validates(:name, 
		presence: true, 
		length: { maximum: 50 }
	)

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+[\.]{1}[a-z]+\z/i
	validates(:email, 
		presence: true, 
		format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }
	)

	# Validates password length
	validates(:password,
		length: { in: 6..60 }
	)

	has_secure_password
end
