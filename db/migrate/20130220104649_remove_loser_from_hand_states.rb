class RemoveLoserFromHandStates < ActiveRecord::Migration
  def up
    remove_column :hand_states, :loser
      end

  def down
    add_column :hand_states, :loser, :integer
  end
end
