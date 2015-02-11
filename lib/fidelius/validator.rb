module Fidelius
  Result = Struct.new(:safe, :reason)

  class Validator
    def initialize(_ = {})
    end

    def validate(_)
      Result.new false, 'This site is broken'
    end
  end
end
