
class Building < ActiveRecord::Base
    belongs_to :property
    has_one :owner, class_name: "User", through: :property
end

