class CommentService
  class << self

    def conn
      Faraday.new(url: "https://still-hamlet-71640.herokuapp.com/api/v1/")
    end

    def json_response(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_all_comments(blog_id)
      response = conn.get("blogs/#{blog_id}/comments")
      json_response(response)
    end
  end
end
