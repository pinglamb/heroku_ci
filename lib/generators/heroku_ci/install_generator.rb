require 'rails/generators'

module HerokuCi
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    include Rails::Generators::Migration

    desc "HerokuCi installation generator"

    def install
      migration_template 'migration_devise_create_users.rb', 'db/migrate/devise_create_users'
    end

    def self.next_migration_number(dirname)
      if ActiveRecord::Base.timestamped_migrations
        migration_number = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        migration_number += 1
        migration_number.to_s
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end

    private

    def display(output, color = :green)
      say("           -  #{output}", color)
    end
  end
end
