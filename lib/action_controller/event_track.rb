require 'active_support/inflector'
require 'active_support/notifications'
module ActionController

  module EventTrack
    extend ActiveSupport::Concern
    module ClassMethods
      attr_accessor :resource_name

      def track_event(resource_name=nil, options = {})
        self.resource_name=resource_name if resource_name
        after_action :create_event, only: options[:only], except: options[:except]
        include InstanceMethod
      end
    end

    module InstanceMethod

      def create_event
        if %w{POST PUT DELETE}.include?(request.method) and resource and resource.persisted? and resource.errors.empty?
          event = ::EventTrack::Event.create(trackable: resource, owner: current_user, key: action_name)
          ActiveSupport::Notifications.instrument("#{action_name}.#{controller_name}", event: event)
        end
      end

      def resource_name
        self.class.resource_name|| controller_name.singularize
      end

      def resource
        self.instance_variable_get("@#{resource_name}")
      end

    end

    def track_event(resource, parameters={})
      event = ::EventTrack::Event.create(trackable: resource, owner: current_user, key: action_name, parameters: parameters)
      ActiveSupport::Notifications.instrument("#{action_name}.#{controller_name}", event: event)
    end
  end
end