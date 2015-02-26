require 'event_track/version'
require 'action_controller'
require 'rails/railtie'

module ActionController
  autoload :EventTrack, 'action_controller/event_track'
end
module EventTrack

  autoload :Event, 'event_track/orm/event'
  autoload :Config, 'event_track/config'
  autoload :Subscriber, 'event_track/subscriber'
  class << self
    def configure(&block)
      EventTrack::Config.configure(&block)
    end

    def config
      EventTrack::Config.config
    end
  end


end
ActiveSupport.on_load(:action_controller) do
  include ActionController::EventTrack
end
