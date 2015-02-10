require 'open-uri'
require 'set'

module Fidelius
  module List
    PASSWORD_FILE = 'passwords.txt'
    PASSWORD_VERSION = 'v0.0.0'

    def password_list
      @password_list ||= open(password_url) do |fh|
        fh.each_line.each_with_object(Set.new) do |line, set|
          begin
            set << line.strip
          rescue ArgumentError
            nil
          end
        end
      end
    end

    def password_url
      [
        'https://github.com/akerl/fidelius/releases/download',
        PASSWORD_VERSION,
        PASSWORD_FILE
      ].join('/')
    end
  end
end
