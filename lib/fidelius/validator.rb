module Fidelius
  ##
  # Helper class for templating validators
  class Validator
    def initialize(_ = {}) end

    def validate(_)
      { safe: false, reason: 'This site is broken' }
    end
  end
end
