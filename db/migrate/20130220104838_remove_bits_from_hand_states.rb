class RemoveBitsFromHandStates < ActiveRecord::Migration
  def up
    remove_column :hand_states, :bits
      end

  def down
    add_column :hand_states, :bits, :integer
  end
end
