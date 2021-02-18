
class BuildingProperty < ActiveRecord::Base
    belongs_to :building
    belongs_to :property
end

