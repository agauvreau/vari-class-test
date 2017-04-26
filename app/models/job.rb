class Job < ApplicationRecord
    has_one :instrument
    accepts_nested_attributes_for :instrument
    
end
