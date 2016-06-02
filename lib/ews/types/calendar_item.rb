module Viewpoint::EWS::Types
  class CalendarItem
    include Viewpoint::EWS
    include Viewpoint::EWS::Types
    include Viewpoint::EWS::Types::Item

    CALENDAR_ITEM_KEY_PATHS = {
      recurring?:   [:is_recurring, :text],
      meeting?:     [:is_meeting, :text],
      cancelled?:   [:is_cancelled, :text],
      duration:   [:duration, :text],
      time_zone:   [:time_zone, :text],
      start:   [:start, :text],
      end:   [:end, :text],
      location:   [:location, :text],
      all_day?:   [:is_all_day_event, :text],
      organizer_email: [:organizer, :elems, 0, :mailbox, :elems, 1, :email_address, :text],
      optional_attendees: [:optional_attendees, :elems ],
      required_attendees: [:required_attendees, :elems ],
      recurrence: [:recurrence, :elems ],
      deleted_occurrences: [:deleted_occurrences, :elems ],
      modified_occurrences: [:modified_occurrences, :elems ],
      calendar_item_type: [:calendar_item_type, :text]
   }

    CALENDAR_ITEM_KEY_TYPES = {
      recurring?:   ->(str){str.downcase == 'true'},
      meeting?:     ->(str){str.downcase == 'true'},
      cancelled?:   ->(str){str.downcase == 'true'},
      all_day?:   ->(str){str.downcase == 'true'},
      optional_attendees: :build_attendees_users,
      required_attendees: :build_attendees_users,
      deleted_occurrences: :build_deleted_occurrences,
      modified_occurrences: :build_modified_occurrences
    }

    CALENDAR_ITEM_KEY_ALIAS = {}


    private

    def key_paths
      super.merge(CALENDAR_ITEM_KEY_PATHS)
    end

    def key_types
      super.merge(CALENDAR_ITEM_KEY_TYPES)
    end

    def key_alias
      super.merge(CALENDAR_ITEM_KEY_ALIAS)
    end


  end
end
