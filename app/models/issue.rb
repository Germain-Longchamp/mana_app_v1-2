class Issue < ApplicationRecord
    belongs_to :company
    belongs_to :engine, optional: true
    belongs_to :user

    has_rich_text :info
end
