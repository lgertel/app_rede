class RolifyCreateAdminRoles < ActiveRecord::Migration[5.1]
  def change
    create_table(:admin_roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:admin_users_admin_roles, :id => false) do |t|
      t.references :user
      t.references :role
    end

    add_index(:admin_roles, :name)
    add_index(:admin_roles, [ :name, :resource_type, :resource_id ])
    add_index(:admin_users_admin_roles, [ :user_id, :role_id ])
  end
end
