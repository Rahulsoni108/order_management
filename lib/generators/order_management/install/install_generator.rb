module OrderManagement
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path("templates", __dir__)

      def self.next_migration_number(dirname)
        @last_migration_number ||= Time.now.utc.strftime("%Y%m%d%H%M%S").to_i

        @last_migration_number += 1
        @last_migration_number.to_s
      end

      def create_order_migration
        migration_template "addresses_migration.rb", "db/migrate/create_addresses.rb", migration_version: migration_version
        migration_template "order_migration.rb", "db/migrate/create_orders.rb", migration_version: migration_version
        migration_template "order_items_migration.rb", "db/migrate/create_order_items.rb", migration_version: migration_version
      end

      def add_routes
        route "mount OrderManagement::Engine, at: '/orders'"
      end

      def migration_version
        "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
      end
    end
  end
end
