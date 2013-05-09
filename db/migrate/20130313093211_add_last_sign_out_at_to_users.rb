class AddLastSignOutAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_sign_out_at, :timestamp
  end
end
