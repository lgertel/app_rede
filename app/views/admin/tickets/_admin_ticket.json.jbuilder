json.extract! admin_ticket, :id, :flow_id, :cnpj, :name, :description, :city, :state, :address, :audio, :dossier, :report, :created_at, :updated_at
json.url admin_ticket_url(admin_ticket, format: :json)
