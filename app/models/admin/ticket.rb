class Admin::Ticket < ApplicationRecord
  belongs_to :flow, :class_name => 'Admin::Flow'

  scope :eps, -> {
    includes(:flow).where(admin_flows: {:flow_type => 1, :stage => 1})
  }
end
