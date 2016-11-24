class SessionsController < ApplicationController
  def new
  end

  # POST...
  def create
    @user = User.find_by username: params[:username]
    if !@user.nil? && @user.password == params[:password_hash]
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to login_path
    end
  end

  # DESTROY...
  def destroy
    reset_session
    redirect_to root_path
  end
end
