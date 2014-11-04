class UsersController < ApplicationController

	before_action :authenticate_user!

	def edit

	end

	def show

	end

	def create
  		@user = User.create( user_params )
	end

	def destroy
		redirect_to destroy_user_session_path

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
