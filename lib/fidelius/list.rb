require 'open-uri'
require 'set'

module Fidelius
  module List
    PASSWORD_FILE = 'passwords.txt'
    PASSWORD_VERSION = 'v0.0.0'
    PASSWORD_LIST = Set.new

    def self.included(_)
      load_password_list
    end

    def self.load_password_list
      open(password_url) do |fh|
        fh.each_line do |line, set|
          begin
            PASSWORD_LIST << line.strip
          rescue ArgumentError
            nil
          end
        end
      end
    end

    def self.password_url
      [
        'https://github.com/akerl/fidelius/releases/download',
        PASSWORD_VERSION,
        PASSWORD_FILE
      ].join('/')
    end
  end
end
