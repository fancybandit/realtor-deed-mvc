
class Property < ActiveRecord::Base
    has_one :deed
    has_one :owner, class_name: "User", through: :deed
end

