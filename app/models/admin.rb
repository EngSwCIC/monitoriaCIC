class Admin < ActiveRecord::Base
  has_secure_password

  self.primary_key = :id
end