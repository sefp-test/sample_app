class SessionsController < ApplicationController

	def new
	end

	def create
		email = params[:session][:email]
		passwd = params[:session][:password]

		user = User.find_by_email email.downcase
		user && user.authenticate(passwd) ? auth_success(user) : auth_failure
	end

	def destroy
		sign_out
		redirect_to root_url
	end

	private

	def auth_success(user)
		# Defined in SessionsHelper
		sign_in(user)
		redirect_to(user)
	end

	def auth_failure
		flash.now[:error] = 'Invalid email/password combination'
		render 'new'
	end

end
