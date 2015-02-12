module EventTracker
  class Event < ActiveRecord::Base
    # TODO 这里需要 可以自定义表名称
    # TODO 支持多种ORM
    self.table_name = 'events'
    belongs_to :trackable, polymorphic: true
    belongs_to :owner, polymorphic: true
  end
end