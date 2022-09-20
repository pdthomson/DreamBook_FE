class CommentService
  class << self

    def conn
      Faraday.new(url: "https://fast-scrubland-25173.herokuapp.com")
      # Faraday.new(url: ENV['BACKEND_URL'])
    end

    def json_response(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_all_comments(blog_id)
      response = conn.get("/api/v1/blogs/#{blog_id}/comments")
      json_response(response)
    end

    def send_comment(comment_params)
      blog_id = comment_params[:blog_id].to_i
      response = conn.post("blogs/#{blog_id}/comments", {
        comment_text: comment_params[:comment_text],
        blog_id: comment_params[:blog_id],
        user_id: comment_params[:user_id],
      }.to_json, "Content-Type" => "application/json")
      json_response(response)
    end
  end
end
