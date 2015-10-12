require 'active_support/subscriber'
module EventTrack
  class Subscriber < ActiveSupport::Subscriber
    def finish(name, id, payload)
      if name=='event.event_track'
        send(track_event) and return
      end
      event = event_stack.pop.payload[:event]
      method = name.split('.').first
      send(method, event)
    end
  end
end
