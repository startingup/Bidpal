class RolifyCreateRoles < ActiveRecord::Migration
  def change
    create_table(:users_roles, :id => false) do |t|
      t.references :user
      t.references :role
    end

    add_index(:roles, :name)
    add_index(:users_roles, [ :user_id, :role_id ])
  end
end
