class Comment

attr_reader :user_id, :blog_id, :comment_text

  def initialize(data)
    @user_id = data[:attributes][:user_id]
    @blog_id = data[:attributes][:blog_id]
    @comment_text= data[:attributes][:comment_text]
  end
end
