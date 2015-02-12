require 'event_tracker/version'
require 'action_controller'
require 'rails/railtie'

module ActionController
  autoload :EventTracker, 'action_controller/event_tracker'
end
module EventTracker
  autoload :Event, 'event_tracker/orm/event'
end
ActiveSupport.on_load(:action_controller) do
  include ActionController::EventTracker
end
