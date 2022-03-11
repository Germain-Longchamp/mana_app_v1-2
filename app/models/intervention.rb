class Intervention < ApplicationRecord
    belongs_to :company
    belongs_to :engine, optional: true
    belongs_to :user, optional: true
    belongs_to :intervention_category, optional: true

end
