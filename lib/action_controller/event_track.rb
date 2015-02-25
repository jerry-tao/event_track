require 'active_support/inflector'
module ActionController

  module EventTrack
    extend ActiveSupport::Concern
    module ClassMethods

      def track_event(resource_name=nil, options = {})
        # TODO 这里需要 可以pass only&except 给after_action
        @_resource_name=resource_name
        after_action :create_event
        include InstanceMethod
      end

      def resource_name
        @_resource_name
      end
    end

    module InstanceMethod

      def create_event(resource=nil, parameters=nil)
        return unless %w{POST PUT DELETE}.include?(request.method)
        return if resource.has_errors?
        # TODO resource 不存在跳过
        # TODO 还需要抛出异常
        ::EventTrack::Event.create(trackable: resource, owner: current_user, key: action_name, parameters: parameters)
      end

      def resource_name
        self.class.resource_name || controller_name.singularize
      end

      def resource
        self.instance_variable_get("@#{resource_name}")
      end

      def track_event(resource, parameters={})
        create_event(resource, parameters)
      end
    end
  end
end