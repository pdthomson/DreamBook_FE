class Blog
  attr_reader :title,
              :body,
              :status,
              :user_id,
              :id,
              :keyword,
              :created_at

  def initialize(data)
    @id = data[:id].to_i
    @title = data[:attributes][:title]
    @body = data[:attributes][:body]
    @status = data[:attributes][:status]
    @user_id = data[:attributes][:user_id]
    @keyword = data[:attributes][:keyword]
    @created_at = data[:attributes][:created_at]
  end
end
