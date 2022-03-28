class AddUsernameToInvitation < ActiveRecord::Migration[6.1]
  def change
    add_column :invitations, :username, :string
  end
end
