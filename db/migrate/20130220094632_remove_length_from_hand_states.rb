class RemoveLengthFromHandStates < ActiveRecord::Migration
  def up
    remove_column :hand_states, :length
      end

  def down
    add_column :hand_states, :length, :integer
  end
end
