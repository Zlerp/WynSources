class User < ActiveRecord::Base
  has_secure_password

  has_many :resources, dependent: :destroy
  has_many :comments
end
