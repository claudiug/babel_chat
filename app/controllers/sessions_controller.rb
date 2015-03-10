class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username))
    if @user.valid?
      session[:username] = @user.username
      session[:type] = params[:type]
      flash[:info] = "Welcome #{@user.username}"
      redirect_to messages_path
    else
      flash[:error] = 'Please fix the errors'
      render :new
    end
  end
end
