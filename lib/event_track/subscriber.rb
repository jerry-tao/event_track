require 'active_support/subscriber'
module EventTrack
  class Subscriber < ActiveSupport::Subscriber
    def finish(name, id, payload)
      event = event_stack.pop.payload[:event]
      if name=='track_event.event_track'
        send(:track_event,event) and return
      end
      method = name.split('.').first
      send(method, event)
    end
  end
end
