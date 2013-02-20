class RemoveFlFromHandStates < ActiveRecord::Migration
  def up
    remove_column :hand_states, :fl
      end

  def down
    add_column :hand_states, :fl, :integer
  end
end
