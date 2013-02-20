class RemoveFvFromHandStates < ActiveRecord::Migration
  def up
    remove_column :hand_states, :fv
      end

  def down
    add_column :hand_states, :fv, :integer
  end
end
