class RemoveControlFromHandStates < ActiveRecord::Migration
  def up
    remove_column :hand_states, :control
      end

  def down
    add_column :hand_states, :control, :integer
  end
end
