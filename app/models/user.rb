class User < ApplicationRecord

  has_secure_password

  has_many :tickets

  # validates :name, presence:  true, length: { minimum: 3 }
  # validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, uniqueness: true, allow_blank: true
end
