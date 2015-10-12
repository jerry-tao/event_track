module EventTrack
  class Event < ActiveRecord::Base
    # TODO 支持多种ORM
    self.table_name = EventTrack.config.table_name
    serialize :parameters
    belongs_to :trackable, polymorphic: true
    belongs_to :owner, polymorphic: true

    after_create :instrument_event

    def instrument_event
      ActiveSupport::Notifications.instrument('track_event.event_track', event: self)
    end

  end
end
