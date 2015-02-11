require 'sinatra/base'

require 'lib/fidelius/validator'
require 'lib/fidelius/list'
require 'lib/fidelius/zxcvbn'

require 'json'

module Fidelius
  VALIDATORS = [
    Fidelius::List.new(uri: 'https://github.com/akerl/fidelius/releases/download/v0.0.0/passwords.txt'),
    Fidelius::Zxcvbn.new
  ]

  ##
  # Base handler for application
  class Base < Sinatra::Base
    set :views, 'views'
    set :public_folder, 'public'

    get '/' do
      @result = nil
      erb :index
    end

    post '/' do
      redirect('/') unless params.include? 'password'
      @result = validate params['password']
      erb :index
    end

    get '/api' do
      headers 'Content-Type': 'application/json'
      halt 405, erb(:post_not_get)
    end

    post '/api' do
      headers 'Content-Type': 'application/json'
      halt(400, erb(:missing_password)) unless params.include? 'password'
      @result = validate params['password']
      erb :api_result
    end

    def validate(password)
      results = VALIDATORS.map { |x| x.validate password }
      results.reject! { |x| x[:safe] }
      return { safe: true } if results.empty?
      { safe: false, reasons: results.map { |x| x[:reason] } }
    end
  end
end
