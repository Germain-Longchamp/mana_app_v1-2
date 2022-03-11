class Issue < ApplicationRecord
    belongs_to :company
    belongs_to :engine, optional: true
    belongs_to :user, optional: true
    belongs_to :type, optional: true

    has_one :intervention

    has_rich_text :info

    mount_uploader :validation_file, ValidationFileUploader
end
