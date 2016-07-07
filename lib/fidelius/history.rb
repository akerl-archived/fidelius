# frozen_string_literal: true
require 'redis'

module Fidelius
  ##
  # Add historical validator
  # Uses a redis DB to identify previously identified passwords
  class History < Validator
    REASON = 'This password has been logged on a' \
      '3rd party password checking site'

    def initialize(params = {})
      @redis = Redis.new(params)
    end

    def validate(password)
      @redis.set password, ''
      return { safe: true } unless @redis.exists password
      {
        safe: false,
        reason: REASON
      }
    rescue Redis::CannotConnectError
      { safe: true }
    end
  end
end
