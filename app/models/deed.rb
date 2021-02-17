
class Deed < ActiveRecord::Base
    belongs_to :owner, class_name: "User"
    belongs_to :property

    validates :owner_name, presence: true
    validates :date_signed, presence: true
end

