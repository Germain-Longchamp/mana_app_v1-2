class Type < ApplicationRecord
    belongs_to :company
    has_many :issues
end
