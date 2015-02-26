require 'active_support/subscriber'
module EventTrack
  class Subscriber < ActiveSupport::Subscriber
    def finish(name, id, payload)
      event = event_stack.pop.payload[:event]
      method = name.split('.').first
      send(method, event)
    end
  end
end