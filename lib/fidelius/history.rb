require 'redis'

module Fidelius
  class History < Validator
    def initialize(params = {})
      @redis = Redis.new(params)
    end

    def validate(password)
      @redis.set password, ''
      return { safe: true } unless @redis.exists password
      {
        safe: false,
        reason: 'This password has been logged on a 3rd party password checking site'
      }
    rescue Redis::CannotConnectError
      { safe: true }
    end
  end
end
