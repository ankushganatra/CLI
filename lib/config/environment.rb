# environment.rb
# recursively requires all files in ./lib and down that end in .rb

require 'active_record'
require 'mysql2'
require_relative "../db/migrate/20150711000001_create_properties"

Dir.glob('./lib/*').each do |folder|
  Dir.glob(folder +"/*.rb").each do |file|
    require file
  end
end

class Environment

  ADAPTER = 'mysql2'
  USER_NAME = 'root'
  PASSWORD = 'root'
  DB_DEV = 'cli_development'
  DB_TEST = 'cli_test'
  HOST = 'localhost'

  def self.init()
    begin
      string = "mysql -u#{USER_NAME} -p#{PASSWORD} -qfsBe \"SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME='#{DB_DEV}'\""
      result = `#{string}`
      if result.blank?
        create
        establish_connection
        migrate
      else
        establish_connection
      end

    end
  end
  def self.establish_connection
    # tells AR what db file to use
    ActiveRecord::Base.establish_connection(
        adapter:  ADAPTER,
        database: DB_DEV,
        username: USER_NAME,
        password: PASSWORD,
        host:     HOST
    )
  end
  def self.create
    client = Mysql2::Client.new(:host => HOST, :username => USER_NAME, :password => PASSWORD)
    client.query("CREATE DATABASE IF NOT EXISTS #{DB_DEV}")
    client.close
  end

  def self.migrate
    CreatePropertyTable.up
  end
end

Environment.init

