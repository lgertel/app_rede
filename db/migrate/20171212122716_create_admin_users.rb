class CreateAdminUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :role_id

      t.timestamps
    end
  end
end
