class Room < ApplicationRecord
    has_many :engines
    belongs_to :company
end
