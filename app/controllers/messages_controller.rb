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
    
    select_language_type
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
        type: @type
    }
  end

  def select_language_type
    case @type
      when 'yoda'
       Thread.new { @message = YodaDialect.new(@message, @type).translate }
      when 'valley'
        Thread.new { @message = ValleyGirlDialect.new(@message, @type).translate }
      when 'pirate'
        Thread.new { @message = PirateDialect.new(@message, @type).translate }
      when 'binary'
       Thread.new { @message = BinaryDialect.new(@message).translate }
      else
        @message = 'cannot translate'
    end
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
