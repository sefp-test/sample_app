module UsersHelper
	
	# Returns the Gravatar for the given user
	# according to email address
	def gravatar_for user, **options
		# Find Gravatar by MD5 hash out of email
		size = options[:size]
		gravatar_id  = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		gravatar_url << "?s=#{size}" if size
		# Returns an HTML tag for image
		# example: <img alt="Icon" class="menu_icon" src="/icons/icon.gif" />
		image_tag(gravatar_url, alt: user.name, class: 'gravatar')
	end
end
