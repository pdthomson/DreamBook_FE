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
    created_blog = blog_params[:keyword].include?(' ')
    if created_blog
      flash[:notice] = 'Keyword must be one word!'
      redirect_to new_blog_path
    else
      BlogService.send_blog(blog_params)
      redirect_to dashboard_path
    end
  end

  def edit
    @blog = BlogFacade.user_blog(params[:id])
  end

  def update
    blog = BlogFacade.update_blog(blog_params)
    if blog.update(blog_params)
      redirect_to blog_path(blog_params[:id])
      flash[:alert] = "Blog has been updated!"
    else
      redirect_to edit_blog_path(blog_params[:id])
      flash[:alert] = "Error: Missing data"
    end
  end

  def destroy
    binding.pry
    BlogService.delete_blog(blog_params)
    flash[:success] = 'Blog Deleted!'
    redirect_to dashboard_path
  end

  private

  def blog_params
    params.permit(:title, :body, :user_id, :status, :keyword, :id)
  end
end
