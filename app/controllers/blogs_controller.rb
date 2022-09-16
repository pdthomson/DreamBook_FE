class BlogsController < ApplicationController

  def index
    @user = current_user
  end

  def show
  end

  def new
  end
end
