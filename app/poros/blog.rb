class Blog 
  attr_reader :title,
              :body,
              :status,
              :user_id

  def initialize(data)
    # binding.pry
    @title = data[:attributes][:title]
    @body = data[:attributes][:body]
    @status = data[:attributes][:status]
    @user_id = data[:attributes][:user_id]
  end
end