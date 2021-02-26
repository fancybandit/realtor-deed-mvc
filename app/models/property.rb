
class Property < ActiveRecord::Base
    has_one :deed
    has_one :owner, class_name: "User", through: :deed
    has_many :building_properties
    has_many :buildings, through: :building_properties

    validates :address, presence: true, uniqueness: true
    validates :price, presence: :true, numericality: {greater_than_or_equal_to: 0}
    validates :acreage, presence: true, numericality: {greater_than_or_equal_to: 0}
    
    validates :date_sold, presence: true
    validate :date_sold_cannot_be_in_future

    def date_sold_cannot_be_in_future
        if date_sold > Date.today
            errors.add(:date_sold, "can't be in the future")
        end
    end
end

