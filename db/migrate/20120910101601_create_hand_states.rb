class CreateHandStates < ActiveRecord::Migration
  def change
    create_table :hand_states do |t|
      t.string :email
      t.integer :length
      t.integer :points
      t.integer :fl
      t.integer :fv
      t.integer :together
      t.integer :totalpots
      t.integer :totalfl
      t.integer :totalfv
      t.integer :bits
      t.integer :loser
      t.integer :totalloser
      t.integer :control
      t.integer :totalcontrol
      t.integer :counts
      t.integer :totalcounts
      t.timestamps
    end
  end
end
