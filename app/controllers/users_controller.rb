class UsersController < ApplicationController

  def show
    @users = User.all
    @user_events = @users.each do |user|
      user.created_events
    end
  end

end
