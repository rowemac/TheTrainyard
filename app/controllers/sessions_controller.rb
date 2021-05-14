class SessionsController < ApplicationController
  def new
  end

  def login
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to concerts_path
    else
      flash[:notice] = "Username and/or Password are invalid. Please try again."
      redirect_to '/login'
    end 
  end


  def google
    @user = User.find_or_create_by(email: auth["info"]["email"]) do |user| 
        user.password =  SecureRandom.hex(10)
        user.name = auth["info"]["name"]
        user.username = auth["info"]["name"]
    end 
    if @user && @user.id
        session[:user_id] = @user.id
        redirect_to user_path(@user) 
    else
      flash[:notice] = "Something went wrong."
        redirect_to "/"
    end 
  end

  def auth
    request.env['omniauth.auth']
  end

  def destroy
    session.clear
    flash[:notice] = "You have successfully logged out."
    redirect_to '/login'
  end
end
