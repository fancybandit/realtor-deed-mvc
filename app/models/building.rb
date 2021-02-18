
class Building < ActiveRecord::Base
    has_one :building_property
    has_one :property, through: :building_property
    has_one :owner, class_name: "User", through: :property

    validates :year_built, presence: true, numericality: {only_integer: true}
    validates :price, presence: :true, numericality: {greater_than_or_equal_to: 0}
end

