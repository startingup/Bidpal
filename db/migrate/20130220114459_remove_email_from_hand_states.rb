class RemoveEmailFromHandStates < ActiveRecord::Migration
  def up
    remove_column :hand_states, :email
      end

  def down
    add_column :hand_states, :email, :string
  end
end
