class BlogsController < ApplicationController

  def index
    @user = current_user
  end

  def show
  end

  def new
  end

  def create
    BlogService.send_blog(blog_params)
    redirect_to dashboard_path
  end

  private

  def blog_params
    params.permit(:title, :body, :user_id, :status)
  end
end
