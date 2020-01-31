class User < ApplicationRecord
has_many :park_collections

has_secure_password

validates_presence_of :username

validates_uniqueness_of :username

end
