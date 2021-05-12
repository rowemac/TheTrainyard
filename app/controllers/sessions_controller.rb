class SessionsController < ApplicationController
  def new
  end

  def login
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to concerts_path
    else
      # flash[:notice] = "Username and/or Password are invalid. Please try again."
      redirect_to '/login'
    end 
  end

  def destroy
    session.clear
    redirect_to '/login'
  end
end
