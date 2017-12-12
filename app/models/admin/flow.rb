class Admin::Flow < ApplicationRecord
  belongs_to :role, :class_name => 'Admin::Role'

end
