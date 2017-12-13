class CreateAdminTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_tickets do |t|
      t.integer :flow_id
      t.integer :ticket_type
      t.string :cnpj
      t.string :name
      t.string :description
      t.string :city
      t.string :state
      t.string :address
      t.string :audio
      t.string :dossier
      t.boolean :dossier_status
      t.boolean :debits_status
      t.boolean :comercial_status
      t.boolean :rollout_customer_validate
      t.boolean :rollout_customer_verification
      t.boolean :rollout_eps_details
      t.boolean :rollout_date_inform
      t.boolean :consolidate_schedule
      t.boolean :rollout_approve_installation
      t.string :report

      t.timestamps
    end
  end
end
