module EnginesHelper
    def events_ajax_previous_link
        ->(param, date_range) { link_to, {param => date_range.first - 1.day }, remote: :true}
    end

    def events_ajax_next_link
        ->(param, date_range) { link_to, {param => date_range.last + 1.day }, remote: :true}
    end
end
