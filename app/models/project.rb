require 'heroku_ci/ssh_utils'

class Project < ActiveRecord::Base
  has_many :builds, :dependent => :destroy

  def directory
    File.join(Rails.root, 'tmp', self.name)
  end
end
