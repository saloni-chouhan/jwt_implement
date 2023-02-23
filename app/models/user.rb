class User < ApplicationRecord
  has_secure_password

  validates :email, :password, :user_name, presence: true
  validates :user_name, uniqueness: true
  validates :phone, phone: true
end
