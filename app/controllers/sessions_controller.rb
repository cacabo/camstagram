require 'pry'

class SessionsController < ApplicationController
  # GET /sessions
  def new
  end

  # POST...
  def create
    @user = User.find_by username: params[:username]
    binding.pry
    if !@user.nil? && @user.password == params[:password]
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
