require 'heroku_ci/ssh_utils'

class Project < ActiveRecord::Base
  has_many :builds
end
