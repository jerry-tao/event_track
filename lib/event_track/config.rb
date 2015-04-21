module EventTrack
  class Config
    include ActiveSupport::Configurable

    configure do |config|
      config.table_name = 'events'
      config.log_failed_event = false
    end
  end
end