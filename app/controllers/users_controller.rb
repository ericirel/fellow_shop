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
		@user = User.find(params[:id])
		if @user.update(user_params)
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
		@user = User.find(params[:id])
		if @user.destroy
			redirect_to root_path
		else
			flash[:alert] = "Could not delete. Sorry"
			redirect_to users_path
		end
	end

private

	def user_params
  		params.require(:user).permit(:avatar, :github_link, :username, :fname,
  							:lname, :email, :password, :location)
	end

	def set_user
		@user = User.find(params[:id])
	end
end

def subscribe
  @user = User.find(params[:id])
  @user.subscribe_to_mailchimp(true)
end
