
class User < ActiveRecord::Base
    has_secure_password #password(=), authenticate, password_confirmation
    has_many :deeds
    has_many :properties, through: :deeds
    has_many :buildings, through: :properties
end

