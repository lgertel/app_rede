class Admin::Ticket < ApplicationRecord
  resourcify

  belongs_to :flow, :class_name => 'Admin::Flow'
end
