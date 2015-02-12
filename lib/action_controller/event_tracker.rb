require 'active_support/inflector'
module ActionController

  module EventTracker
    extend ActiveSupport::Concern
    module ClassMethods
      def track_event(resource_name=nil, options = {})
        # TODO 这里需要 可以自定义resource name 可以pass only&except 给after_action
        self.after_action :create_event
        include InstanceMethod
      end
    end

    module InstanceMethod
      def create_event
        # TODO resource 不存在跳过
        # TODO resource errors跳过
        # TODO 当且仅当http verb是post put delete的时候才执行
        # TODO 还需要抛出异常
        resource = self.instance_variable_get("@#{controller_name.singularize}")
        event = ::EventTracker::Event.create(trackable: resource, owner: current_user, key: action_name)

        p event
      end

      def track_event(resource, options={})

      end
    end
  end
end