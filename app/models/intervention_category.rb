class InterventionCategory < ApplicationRecord
    belongs_to :company
    has_many :interventions
end
