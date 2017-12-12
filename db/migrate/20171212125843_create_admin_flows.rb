class CreateAdminFlows < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_flows do |t|
      t.integer :flow_type
      t.integer :stage
      t.integer :role_id

      t.timestamps
    end
  end
end
