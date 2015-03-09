class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username))
    if @user.valid?
      session[:username] = @user.username
      flash[:info] = "Welcome #{@user.username}"
      redirect_to #TODO chat here
    else
      flash[:error] = "Please fix the errors"
      render :new
    end
  end
end
