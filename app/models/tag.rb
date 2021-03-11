class Tag < ApplicationRecord
    has_many :taggings
    has_many :engines, through: :taggings
end
