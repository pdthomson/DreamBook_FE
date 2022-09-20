class BlogsController < ApplicationController

  def index
    @user = current_user
    @blogs = BlogFacade.all_blogs
  end

  def show
    @blog = BlogFacade.user_blog(params[:id])
    @comments = CommentService.get_all_comments(@blog.id)
  end

  def new
  end

  def create
    wip = blog_params[:keyword].include?(' ')
    if wip
      flash[:notice] = 'Keyword must be one word!'
      redirect_to new_blog_path
    else
      BlogService.send_blog(blog_params)
      redirect_to dashboard_path
    end
  end

  private

  def blog_params
    params.permit(:title, :body, :user_id, :status, :keyword)
  end
end
