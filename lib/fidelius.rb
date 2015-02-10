require 'sinatra/base'

require 'lib/fidelius/list'

module Fidelius
  ##
  # Base handler for application
  class Base < Sinatra::Base
    include Fidelius::List

    get '/' do
      "I know about #{password_list.size} passwords"
    end
  end
end
