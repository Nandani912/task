class User < ApplicationRecord
  has_and_belongs_to_many :tasks
  validates :username, presence: true
  validates :email,presence:true
 validates :password, length: { in: 6..12 } 
 has_secure_password
end
