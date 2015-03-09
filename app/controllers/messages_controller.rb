class MessagesController < ApplicationController
  before_filter :check_for_users
  def index
  end

  def create
  end

  private

  def check_for_users
    redirect_to root_path if session[:username].nil?
  end
end
