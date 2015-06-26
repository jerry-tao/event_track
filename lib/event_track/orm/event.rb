module EventTrack
  class Event < ActiveRecord::Base
    # TODO 支持多种ORM
    self.table_name = EventTrack.config.table_name
    serialize :parameters
    belongs_to :trackable, polymorphic: true
    belongs_to :owner, polymorphic: true
  end
end