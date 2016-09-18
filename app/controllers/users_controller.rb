class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find params[:id]
  end

  # Not the final implementation!
  def create
    @user = User.new user_params
    @user.save ? registration_success : registration_failure
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, 
  		:password, :password_confirmation)
  end

  def registration_success
    sign_in(@user)
  	flash[:success] = "Welcome to the Sample App!"
  	redirect_to @user
  end

  def registration_failure
  	render 'new'
  end

end
