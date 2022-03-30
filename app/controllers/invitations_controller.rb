class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    @event = Event.find(invitation_params[:event_id])
    @invitee = User.find_by_username(invitation_params[:username])
    if @event.invitees.include?(@invitee) || @invitee == @event.creator
      flash[:alert] = "User has already been invited."
    else
      @event.invitees << @invitee
      flash[:notice] = "Invited #{@invitee.username}"
    end
    redirect_to @event
  end

  private

  def invitation_params
    params.require(:invitation).permit(:event_id, :user_id, :username)
  end
end
