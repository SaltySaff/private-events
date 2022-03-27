class AttendingEventsController < ApplicationController
  def new
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.find(params[:id])
    @event.attendees << current_user
    flash[:notice] = "You're now attending this event."
    redirect_to root_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    flash[:alert] = "You're no longer attending this event."
    redirect_to root_path
  end
end
