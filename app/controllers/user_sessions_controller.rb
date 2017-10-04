class UserSessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:user][:email], params[:user][:password])
      redirect_back_or_to root_url , notice: "Logged in!"
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    logout
    redirect_back_or_to root_url, notice: 'Logged out!'
  end
end
