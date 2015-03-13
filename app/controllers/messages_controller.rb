class MessagesController < ApplicationController
  before_filter :check_for_users

  def index
  end

  def create
    unless params[:message].present?
      render(:index) && return
    end
    @message = params[:message]
    @type = session[:type]

    @message = Dialect.translate_for_type(@type).with_message(@message).result
    message = build_message
    send_message('/messages/new', message)
    render nothing: true
  end

  def change_language
    session[:type] = params[:type]
    render nothing: true
  end

  private

  def build_message
    {
      time: Time.current.to_formatted_s,
      author: session[:username],
      message: @message,
      dialect_type: @type
    }
  end

  def send_message(channel, what)
    message = { channel: channel, data: { object: what, type: 'message' } }
    uri = URI.parse('http://localhost:9292/faye')
    Net::HTTP.post_form(uri, message: message.to_json)
  end

  def check_for_users
    redirect_to root_path if session[:username].nil?
  end
end
