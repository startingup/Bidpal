class RemoveTotalcontrolFromHandStates < ActiveRecord::Migration
  def up
    remove_column :hand_states, :totalcontrol
      end

  def down
    add_column :hand_states, :totalcontrol, :integer
  end
end
