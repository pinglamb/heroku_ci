require 'heroku_ci/ssh_utils'

class Project < ActiveRecord::Base
  def checkout
    filename = HerokuCi::SSHUtils.add_key('deploy', self.ssh_key)
    HerokuCi::SSHUtils.config_host(self.host, "IdentityFile" => filename)
    FileUtils.rm_rf File.join(Rails.root, 'tmp', self.name)
    system "cd #{File.join(Rails.root, 'tmp')} && git clone #{self.repository} #{self.name}"
  end
end
