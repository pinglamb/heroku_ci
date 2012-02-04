require 'heroku_ci/ssh_utils'
require 'heroku_ci/sqlite_installer'

class Build < ActiveRecord::Base
  belongs_to :project

  delegate :host, :ssh_key, :repository, :to => :project
  delegate :name, :to => :project, :prefix => true

  def checkout
    filename = HerokuCi::SSHUtils.add_key('deploy', self.ssh_key)
    HerokuCi::SSHUtils.config_host(self.host, "IdentityFile" => filename)
    FileUtils.rm_rf project_directory
    system "cd #{File.join(Rails.root, 'tmp')} && git clone #{self.repository} #{self.project_name}"
  end

  def bundle
    ENV['RUBYOPT'] = ''

    sqlite_directory = HerokuCi::SqliteInstaller.install_sqlite_package

    system "rm -Rf #{Rails.root}/.bundle"
    system %Q{sed -i "s/gem\ \'ruby-debug19\'//g" #{project_directory}/Gemfile}
    system %Q{echo "gem 'sqlite3'" >> #{project_directory}/Gemfile}
    system "bundle config build.sqlite3 --with-sqlite3-dir=#{sqlite_directory}"
    system "bundle install --gemfile #{project_directory}/Gemfile --path #{project_directory}/vendor/bundle"
  end

  def build
    ENV['RUBYOPT'] = ''
    ENV['BUNDLE_GEMFILE'] = "#{project_directory}/Gemfile"
    system %Q{sed -i "s/require\ \'ruby-debug\'//g" #{project_directory}/features/support/env.rb}
    system "cp #{Rails.root}/vendor/database.yml #{project_directory}/config"
    system "cd #{project_directory} && RAILS_ENV=development rake db:create"
    system "cd #{project_directory} && RAILS_ENV=development rake db:migrate"
    system "cd #{project_directory} && RAILS_ENV=development rake db:test:prepare && RAILS_ENV=test rake test"
  end

  private

  def project_directory
    File.join(Rails.root, 'tmp', self.project_name)
  end
end
