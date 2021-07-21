class Company < ApplicationRecord
    has_many :users, dependent: :delete_all
    has_many :engines, dependent: :delete_all
    has_many :tags, dependent: :delete_all
    has_many :rooms, dependent: :delete_all
end
