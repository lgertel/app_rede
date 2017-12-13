class Admin::Ticket < ApplicationRecord
  belongs_to :flow, :class_name => 'Admin::Flow'

  scope :eps, -> {
    includes(:flow).where(admin_flows: {:flow_type => 1, :stage => 1})
  }

  scope :backoffice, -> {
    includes(:flow).where(admin_flows: {:flow_type => 1, :stage => 2})
  }

  scope :n2, -> {
    includes(:flow).where(admin_flows: {:flow_type => 1, :stage => [3, 4, 5, 6]})
  }

  scope :cliente, -> {
    includes(:flow).where(admin_flows: {:flow_type => 2, :stage => [1, 6]})
  }

  scope :log_interna, -> {
    includes(:flow).where(admin_flows: {:flow_type => 2, :stage => 2})
  }

  scope :log_externa, -> {
    includes(:flow).where(admin_flows: {:flow_type => 2, :stage => 3})
  }

  scope :pservico, -> {
    includes(:flow).where(admin_flows: {:flow_type => 2, :stage => 4})
  }

  scope :middleoffice, -> {
    includes(:flow).where(admin_flows: {:flow_type => 2, :stage => 5})
  }
end
