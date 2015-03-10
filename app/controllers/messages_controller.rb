class MessagesController < ApplicationController
  before_filter :check_for_users
  def index
  end

  def create
    unless params[:message].present?
      render(:index) && return
    end
    message_and_type
    if @type == 'yoda'
      @message = YodaDialect.new(@message, @type).translate
    elsif @type == 'valley'
      @message = ValleyGirlDialect.new(@message, @type).translate
    elsif @type == 'binary'
      @message = BinaryDialect.new(@message).translate
    elsif @type == 'pirate'
      @message = PirateDialect.new(@message).translate
    end
    @username = session[:username]
    send_message('/messages/new', @message)
    render json: @message
  end

  private

  def message_and_type
    @message = params[:message]
    @type = session[:type]
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
