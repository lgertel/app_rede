class Admin::User < ApplicationRecord
  belongs_to :role, :class_name => 'Admin::Role'
end
