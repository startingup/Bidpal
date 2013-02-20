class RemoveTotalfvFromHandStates < ActiveRecord::Migration
  def up
    remove_column :hand_states, :totalfv
      end

  def down
    add_column :hand_states, :totalfv, :integer
  end
end
