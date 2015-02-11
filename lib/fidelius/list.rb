require 'open-uri'
require 'set'

module Fidelius
  class List < Validator
    def initialize(params = {})
      @uri = params[:uri] || fail('No source provided for list')
    end

    def validate(password)
      return Result.new(true) unless list.include(password)
      Result.new false, 'Password included in compromised lists'
    end

    private

    def list
      @list = open(@uri) do |fh|
        fh.each_line do |line, set|
          begin
            PASSWORD_LIST << line.strip
          rescue ArgumentError
            nil
          end
        end
      end
    end
  end
end
