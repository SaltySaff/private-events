class InvitationsController < ApplicationController
  def new
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.find(params[:id])
    @invitee = User.find(params[:user_id])
    @event.invitees << invitee
    flash[:notice] = "Sent invitation to #{@invitee.username}."
    redirect_to root_path
  end

  def destroy
    @event = Event.find(params[:id])
    @invitee = User.find(params[:user_id])
    @event.invitees.delete(@invitee)
    flash[:alert] = "Deleted invitation to #{@invitee.username}."
    redirect_to root_path
  end
end
