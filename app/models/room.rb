class Room < ApplicationRecord
    has_many :engines, dependent: :delete_all
    belongs_to :company
end
