
class Property < ActiveRecord::Base
    has_one :deed
    has_one :owner, class_name: "User", through: :deed
    has_many :propertybuildings
    has_many :buildings, through: :propertybuildings
end

