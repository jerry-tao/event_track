require 'rails/generators/active_record'


module EventTracker
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      argument :name, :type => :string, :default => 'create_events'
      # Create migration in project's folder
      def generate_files
        migration_template 'migration.rb', "db/migrate/#{name}.rb"
      end

    end
  end
end
