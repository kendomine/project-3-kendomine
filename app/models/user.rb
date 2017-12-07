class User < ApplicationRecord
  has_many :entries
  has_one :profile
  has_secure_password
  validates :username, uniqueness: {case_sensitive:false}
  validates :username, :password,  presence:true
  validates :username, length: { in: 4..10 }
  validates :password, length: { in: 6..20 }
end
