module HerokuCi
  class SqliteInstaller
    class << self
      def install_sqlite_package
        vendor = File.join(Rails.root, 'vendor')
        sqlite_directory = "#{vendor}/sqlite3"

        system "cd #{vendor} && tar xzvf sqlite-autoconf-3071000.tar.gz"
        system "cd #{vendor} && mkdir sqlite3"
        system "cd #{vendor}/sqlite-autoconf-3071000 && ./configure --prefix=#{sqlite_directory}"
        system "cd #{vendor}/sqlite-autoconf-3071000 && make"
        system "cd #{vendor}/sqlite-autoconf-3071000 && make install"

        sqlite_directory
      end
    end
  end
end
