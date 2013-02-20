class RemoveTotalloserFromHandStates < ActiveRecord::Migration
  def up
    remove_column :hand_states, :totalloser
      end

  def down
    add_column :hand_states, :totalloser, :integer
  end
end
