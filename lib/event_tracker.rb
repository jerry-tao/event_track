require 'event_tracker/version'
require 'action_controller'
require 'rails/railtie'

module ActionController
  autoload :EventTracker, 'action_controller/event_tracker'
end
module EventTracker

  autoload :Event, 'event_tracker/orm/event'
  autoload :Config, 'event_tracker/config'

  class << self
    def configure(&block)
      EventTracker::Config.configure(&block)
    end

    def config
      EventTracker::Config.config
    end
  end


end
ActiveSupport.on_load(:action_controller) do
  include ActionController::EventTracker
end
