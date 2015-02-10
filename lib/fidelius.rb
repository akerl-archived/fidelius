require 'sinatra/base'

module Fidelius
  ##
  # Base handler for application
  class Base < Sinatra::Base
    PASSWORD_LIST = 'passwords.txt'

    get '/' do
      redirect to("/user/#{DEFAULT_USER}"), 307
    end

    get %r{^/user/([\w-]+)$} do |user|
      status_message(user)
    end

    post '/sms' do
      @user = guess_user params[:From], params[:Body]
      Twilio::TwiML::Response.new do |r|
        r.Message status_message(user)
      end.text
    end
  end
end
