# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "heroku_ci/version"

Gem::Specification.new do |s|
  s.name        = "heroku_ci"
  s.version     = HerokuCi::VERSION
  s.authors     = ["pinglamb"]
  s.email       = ["pinglambs@gmail.com"]
  s.homepage    = "http://github.com/pinglamb/heroku_ci"
  s.summary     = %q{Free Continuous Integration Server on Heroku}
  s.description = %q{Free Continuous Integration Server on Heroku}

  s.rubyforge_project = "heroku_ci"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_dependency 'rails', '~> 3.1'
  s.add_dependency 'jquery-rails', '>= 1.0'
  s.add_dependency 'bootstrap-sass', ['~> 1.4', '>= 1.4.1']
  s.add_dependency 'haml', '~> 3.1.4'
  s.add_dependency 'devise', '~> 2.0.0'
end
