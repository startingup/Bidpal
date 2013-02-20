class RemoveTotalpotsFromHandStates < ActiveRecord::Migration
  def up
    remove_column :hand_states, :totalpots
      end

  def down
    add_column :hand_states, :totalpots, :integer
  end
end
