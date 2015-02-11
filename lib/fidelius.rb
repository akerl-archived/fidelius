require 'sinatra/base'

require 'lib/fidelius/validator'
require 'lib/fidelius/list'
require 'lib/fidelius/zxcvbn'

require 'json'

module Fidelius
  ##
  # Base handler for application
  class Base < Sinatra::Base
    VALIDATORS = [
      Fidelius::List.new(uri: 'https://github.com/akerl/fidelius/releases/download/v0.0.0/passwords.txt'),
      Fidelius::Zxcvbn.new
    ]

    set :views, 'views'

    get '/' do
      erb :index
    end

    get '/api' do
      halt 405, erb(:post_not_get)
    end

    post '/api' do
      halt(400, erb(:missing_password)) unless params.include? :password
      @result = validate params[:password]
      erb :api_result
    end

    def validate(password)
      results = VALIDATORS.map { |x| x.validate password }
      results.reject!(&:safe)
      return Result.new(true) if results.empty?
      Result.new false, results.map(&:reason)
    end
  end
end
