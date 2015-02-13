module EventTracker
  class Config
    include ActiveSupport::Configurable

    configure do |config|
      config.table_name = 'events'
    end
  end
end