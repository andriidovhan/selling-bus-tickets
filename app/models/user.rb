class User < ApplicationRecord

  has_secure_password

  has_many :tickets

  validates :first_name, presence:  true, length: { within: 2..20 }
  validates :email, presence:  true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
