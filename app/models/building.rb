
class Building < ActiveRecord::Base
    belongs_to :property
    has_one :owner, class_name: "User", through: :property

    validates :year_built, presence: true, numericality: {only_integer: true, less_than_or_equal_to: ->(_building) { Date.current.year }}
    validates :price, presence: :true, numericality: {greater_than_or_equal_to: 0}
end

