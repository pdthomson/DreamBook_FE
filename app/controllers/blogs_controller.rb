class BlogsController < ApplicationController

  def index
    @user = current_user
    @blogs = BlogFacade.all_blogs
  end

  def show
    @blog = BlogFacade.user_blog(params[:id])
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
