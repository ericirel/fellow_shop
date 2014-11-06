class UsersController < ApplicationController

	before_action :authenticate_user!

	def index
		@user = User.all
	end

	def edit
		set_user
	end

	def show
		@user = User.find(params[:id])
	end

	def update
<<<<<<< HEAD
		if @user.update(new_params)
=======
		@user = User.find(params[:id])
		if @user.update(user_params)
>>>>>>> 9320acf82539915a4d8a120ce106b8da1d7533b7
			flash[:notice] = "Profile updated"
			redirect_to current_user
		else
			flash[:alert] = "There was a problem"
			render :edit
		end
	end

	def create
  		@user = User.create( user_params )
	end

	def destroy
		redirect_to destroy_user_session_path

	end

private

	def new_params
		params.require(:user).permit(:username, :fname, :avatar, :avatar,
  							:lname, :email, :password, :location,)
	end

	def user_params
  		params.require(:user).permit(:avatar, :github_link, :username, :fname,
  							:lname, :email, :password, :location, :password_confirmation, :current_password)
	end

	def set_user
		@user = User.find(params[:id])
	end
end

def subscribe
  @user = User.find(params[:id])
  @user.subscribe_to_mailchimp(true)
  # redirect to some other url
end
