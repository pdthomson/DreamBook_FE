class UsersController < ApplicationController

  def new
  end

  def index
  end

  def show
    @user_blogs = BlogFacade.user_blogs(current_user.id)
    if current_user.nil?
      redirect_to root_path
      flash[:notice] = "You must login or register to visit your dashboard."
    else
      @user = current_user
    end
  end

  def create
    auth_hash = request.env['omniauth.auth']
    user = User.find_or_create_by(email: auth_hash[:info][:email],
                                  username: auth_hash[:info][:first_name],
                                  uid: auth_hash[:uid])
    session[:uid] = auth_hash[:uid]
    redirect_to '/dashboard'
  end

  def edit
  end

  def update
    @user = current_user
    current_user.update(user_params)
    if @user.save
      redirect_to dashboard_path
      flash[:alert] = "Your username has successfully been updated."
    else
      redirect_to '/dashboard/update'
      flash[:alert] = "This username already exists"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
    flash[:alert] = 'Account successfully deleted'
  end

  private

  def user_params
    params.permit(:username)
  end
end
