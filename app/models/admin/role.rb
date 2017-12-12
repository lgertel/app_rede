class Admin::Role < ApplicationRecord
  has_many :users, :class_name => 'Admin::User'

end
