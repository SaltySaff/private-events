class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def show_attended_events
    @attended_events = current_user.attended_events
  end
end
