class MessagesController < ApplicationController
  before_filter :check_for_users
  def index
  end

  def create
    @message = params[:messages]
    @type = session[:type]
    @username = session[:username]
    send_message('/messages/new', @message)
    render nothing: true
  end

  def send_message(channel, what)
    message = {channel: channel, data: {object: what, type: 'message'}}
    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, message: message.to_json)
  end

  private

  def check_for_users
    redirect_to root_path if session[:username].nil?
  end
end
