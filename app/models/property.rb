
class Property < ActiveRecord::Base
    has_one :deed
    has_one :owner, class_name: "User", through: :deed
    has_many :building_properties
    has_many :buildings, through: :building_properties

    validates :address, presence: true, uniqueness: true
    validates :price, presence: :true, numericality: {greater_than_or_equal_to: 0}
    validates :year_sold, presence: true, numericality: {only_integer: true}
    validates :acreage, presence: true, numericality: {greater_than_or_equal_to: 0}
end

