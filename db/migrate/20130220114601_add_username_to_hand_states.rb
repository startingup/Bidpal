class AddUsernameToHandStates < ActiveRecord::Migration
  def change
    add_column :hand_states, :username, :string
  end
end
