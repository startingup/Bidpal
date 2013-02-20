class RemoveCountsFromHandStates < ActiveRecord::Migration
  def up
    remove_column :hand_states, :counts
      end

  def down
    add_column :hand_states, :counts, :integer
  end
end
