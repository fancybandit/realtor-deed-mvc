
class Deed < ActiveRecord::Base
    belongs_to :owner, class_name: "User"
    belongs_to :property
end

