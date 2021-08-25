class Engine < ApplicationRecord
    has_many :taggings, dependent: :delete_all
    has_many :tags, through: :taggings
    has_many :issues, dependent: :delete_all

    belongs_to :room, optional: true
    belongs_to :company

    has_rich_text :description
    has_rich_text :provider_info

    def self.tagged_with(name)
        Tag.find_by!(name: name).engines
    end

    def self.tag_counts
        Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
    end

    def tag_list
        tags.map(&:name).join(', ')
    end

    def tag_list=(names)
        self.tags = names.split(',').map do |n|
          Tag.where(name: n.strip).first_or_create!
        end
    end


    def self.roomed_with(name)
        Room.find_by!(name: name).engines
    end

    def room_list
        rooms.map(&:name).join(', ')
    end

    def room_list=(names)
        self.rooms = names.split(',').map do |n|
          Room.where(name: n.strip).first_or_create!
        end
    end

    def has_name?
        if self.name != ""
            return self.name
        else
            return self.internal_name 
        end
    end

    def is_valid?
        start_date = self.validity_start_date
        end_date = self.validity_end_date

        if start_date && end_date
            if start_date < Date.today && end_date > Date.today
              return true 
            else
              return false
            end
        end
    end

    def calc_time_left
        end_date = self.validity_end_date
        date_now = Date.today
        time_left = end_date - date_now

        if date_now < end_date
            return "#{time_left.to_i}j restants"
        elsif date_now == end_date
            return "Aujourd'hui"
        else
            return "#{time_left.to_i.abs}j de retard"
        end
        
    end
end
