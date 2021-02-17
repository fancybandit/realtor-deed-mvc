
class Building < ActiveRecord::Base
    has_one :propertybuilding
    has_one :property, through: :propertybuilding
    has_one :owner, class_name: "User", through: :property
end

