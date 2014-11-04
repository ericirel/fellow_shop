class UsersController < ApplicationController
end

def subscribe
  @user = User.find(params[:id])
  @user.subscribe_to_mailchimp(true)
  # redirect to some other url
end