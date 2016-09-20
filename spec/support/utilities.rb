include ApplicationHelper

# Returns the full title on a per-page basis.
def full_title page_title
  base_title = "Ruby on Rails Tutorial Sample App"
  page_title.empty? ? base_title : "#{base_title} | #{page_title}"
end

# Have error message match
RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		expect(page).to have_selector 'div.alert.alert-error', text: message
	end
end

# Have alert message match
RSpec::Matchers.define :have_alert_message do |message|
	match do |page|
		expect(page).to have_selector 'div.alert.alert-success', text: message
	end
end

# Behavior for valid sign in
def valid_signin(user)
	fill_in "Email", 		with: user.email
	fill_in "Password",	with: user.password
	click_button "Sign in"
end
