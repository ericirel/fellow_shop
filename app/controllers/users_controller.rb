class UsersController < ApplicationController

	before_action :authenticate_user!

	def index
		@user = User.all
	end

	def edit
	end

	def show

	end

	def update
		if @user.update(user_params)
			flash[:notice] = "Profile updated"
			redirect_to @user
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

	def my_profile

	end

private

	def user_params
  		params.require(:user).permit(:fname,
  							:lname, :email, :password, :location, :tag_list)
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
