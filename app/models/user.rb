class User < ActiveRecord::Base
  has_secure_password

  has_many :resources
  has_many :comments
end
