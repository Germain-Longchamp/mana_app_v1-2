class Intervention < ApplicationRecord
    belongs_to :company
    belongs_to :engine, optional: true
end
