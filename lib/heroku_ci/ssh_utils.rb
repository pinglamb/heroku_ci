module HerokuCi
  class SSHUtils
    class << self
      def add_key(name, key)
        filename = "#{ssh_root}/#{name}.pem"
        File.open(filename, "w") do |f|
          f.write(key)
        end
        FileUtils.chmod(0400, filename)
        filename
      end

      def config_host(host, configurations)
        filename = "#{ssh_root}/config"
        File.open(filename, "a") do |f|
          f.write("\n")
          f.write("Host #{host}\n")
          configurations.each do |key, value|
            f.write("  #{key} #{value}\n")
          end
        end
        filename
      end

      private

      def ssh_root
        directory = "#{ENV['HOME']}/.ssh"
        FileUtils.mkdir_p(directory)
        directory
      end
    end
  end
end
