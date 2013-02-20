class RemoveTogetherFromHandStates < ActiveRecord::Migration
  def up
    remove_column :hand_states, :together
      end

  def down
    add_column :hand_states, :together, :integer
  end
end
