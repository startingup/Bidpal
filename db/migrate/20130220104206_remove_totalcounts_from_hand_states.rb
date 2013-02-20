class RemoveTotalcountsFromHandStates < ActiveRecord::Migration
  def up
    remove_column :hand_states, :totalcounts
      end

  def down
    add_column :hand_states, :totalcounts, :integer
  end
end
