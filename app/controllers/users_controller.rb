class UsersController < ApplicationController

  def new
  end

  def index 
  end

  def show
    if current_user.nil?
      redirect_to root_path
      flash[:notice] = "You must login or register to visit your dashboard."
    else
      @user = current_user
    end
  end

  def create 
    user = User.find_or_create_by(email: request.env['omniauth.auth'][:info][:email],
                                  username: request.env['omniauth.auth'][:info][:first_name],  
                                  uid: request.env['omniauth.auth'][:uid])
    session[:uid] = request.env['omniauth.auth'][:uid]
                                  # binding.pry
    redirect_to '/dashboard'
  end
end
