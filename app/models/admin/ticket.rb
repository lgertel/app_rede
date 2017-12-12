class Admin::Ticket < ApplicationRecord
  belongs_to :flow, :class_name => 'Admin::Flow'
end
