require 'rails'
require 'devise'
require 'bootstrap-sass'
require 'heroku_ci'

module HerokuCi
  class Engine < Rails::Engine
    initializer "HerokuCi assets precompile hook" do |app|
      app.config.assets.precompile += ['heroku_ci/heroku_ci.js', 'heroku_ci/heroku_ci.css']
    end
  end
end
