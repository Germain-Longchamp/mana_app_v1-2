class Issue < ApplicationRecord
    belongs_to :company
    belongs_to :engine, optional: true

    has_rich_text :info
end
