class CommentsController < ApplicationController

  def new
    user = current_user
    @blog = BlogFacade.user_blog(params[:blog_id])
  end

  def create
    blog = BlogFacade.user_blog(params[:blog_id])
    CommentService.send_comment(params)
    redirect_to blog_path(blog.id)
  end

  # def comment
  #CommentFacade.delete_blog()
  # flash[:success] = 'Comment Deleted!'
  # redirect_to 
  # end
end

