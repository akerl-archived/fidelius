require 'zxcvbn'

module Fidelius
  class Zxcvbn < Validator
    def validate(password)
      results = Zxcvbn.test(password)
      return Result.new(true) if results.score == 4
      time = results.crack_time_display
      Result.new false, "Password vulnerable to brute force in #{time}"
    end
  end
end
