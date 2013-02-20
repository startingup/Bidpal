class AddNameToHandStates < ActiveRecord::Migration
  def change
    add_column :hand_states, :name, :string
  end
end
