class Blog 
  attr_reader :title,
              :body,
              :status,
              :user_id,
              :id

  def initialize(data)
    @id = data[:id].to_i
    @title = data[:attributes][:title]
    @body = data[:attributes][:body]
    @status = data[:attributes][:status]
    @user_id = data[:attributes][:user_id]
  end
end