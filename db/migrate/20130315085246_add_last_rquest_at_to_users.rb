class AddLastRquestAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_request_at, :timestamp
  end
end
