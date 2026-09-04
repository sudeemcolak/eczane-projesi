class Pharmacist < ApplicationRecord
  has_secure_password
  belongs_to :drugstore
end
