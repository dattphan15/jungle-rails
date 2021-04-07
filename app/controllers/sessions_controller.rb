class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # success logic, log them in
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/', notice: "Logged in!"
    else
      # failure, render login form
      flash.alert = "Wrong email or password"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
