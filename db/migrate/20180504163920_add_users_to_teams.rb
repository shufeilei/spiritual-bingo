class AddUsersToTeams < ActiveRecord::Migration[5.2]
  def change
    add_reference :teams, :user, index: true
  end
end
