class Blog 
  attr_reader :title,
              :body,
              :status,
              :user_id

  def initialize(data)
    @title = data[:data][:attributes][:title]
    @body = data[:data][:attributes][:body]
    @status = data[:data][:attributes][:status]
    @user_id = data[:data][:attributes][:user_id]
  end
end