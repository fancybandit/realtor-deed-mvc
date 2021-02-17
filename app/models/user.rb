
class User < ActiveRecord::Base
    has_many :deeds, class_name: "Deed", foreign_key: "owner_id"
    has_many :properties, through: :deeds
    has_many :buildings, through: :properties

    has_secure_password #password(=), authenticate, password_confirmation
    validates :password, presence: :true, length: {minimum: 6, too_short: "A password must be at least %{count} characters long"}, confirmation: true
    validates :username, presence: :true, uniqueness: true, exclusion: {in: ["admin", "superadmin", "user"]}
    validates :email, presence: :true, uniqueness: :true, format: {with: /\A(?<username>[^@\s+])@((?<domain_name>[-a-z0-9+])\.(?<domain>[a-z]{2,}))\z/i}
    validates :name, presence: true
end

