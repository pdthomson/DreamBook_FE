class CommentsController < ApplicationController

  def new
    user = current_user
    @blog = BlogFacade.user_blog(params[:blog_id])
  end

  def create
  end
end
