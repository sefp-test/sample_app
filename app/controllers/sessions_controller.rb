class SessionsController < ApplicationController

	def new
	end

	def create
		email = params[:session][:email]
		passwd = params[:session][:pssword]

		user = User.find_by_email email.downcase
		user && user.authenticate(passwd) ? auth_success(user) : auth_failure
	end

	def destroy
	end

	private

	def auth_success(user)
		sign_in(user)
		redirect_to(user)
	end

	def auth_failure
		flash.now[:error] = 'Invalid email/password combination'
		render 'new'
	end

end
