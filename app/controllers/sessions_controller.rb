class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path # , notice: "Signed in"
    else
      # flash[:alert] = "Wrong credentials"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path # , notice: "Signed out"
  end

  def guest
    guest = User.find_by_first_name :Guest
    session[:user_id] = guest.id
    redirect_to root_path
  end
end
