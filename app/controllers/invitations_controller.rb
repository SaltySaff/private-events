class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    @event = Event.find(invitation_params[:event_id])
    @invitee = User.find_by_username(invitation_params[:username])
    @event.invitees << @invitee
    flash[:notice] = "Invited #{@invitee.username}"
    redirect_to root_path
  end

  def destroy
    @event = Event.find(params[:id])
    @invitee = User.find(params[:user_id])
    @event.invitees.delete(@invitee)
    flash[:alert] = "Deleted invitation to #{@invitee.username}."
    redirect_to root_path
  end

  private

  def invitation_params
    params.require(:invitation).permit(:event_id, :user_id, :username)
  end
end
