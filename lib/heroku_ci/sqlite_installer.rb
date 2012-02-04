module HerokuCi
  class SqliteInstaller
    class << self
      def install_package
        vendor = File.join(Rails.root, 'vendor')
        system "cd #{vendor} && tar xzvf sqlite-autoconf-3071000.tar.gz"
        system "cd #{vendor} && mkdir sqlite3"
        system "cd #{vendor}/sqlite-autoconf-3071000 && ./configure --prefix=#{vendor}/sqlite3"
        system "cd #{vendor}/sqlite-autoconf-3071000 && make"
        system "cd #{vendor}/sqlite-autoconf-3071000 && make install"
      end
    end
  end
end
