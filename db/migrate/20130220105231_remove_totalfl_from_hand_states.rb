class RemoveTotalflFromHandStates < ActiveRecord::Migration
  def up
    remove_column :hand_states, :totalfl
      end

  def down
    add_column :hand_states, :totalfl, :integer
  end
end
