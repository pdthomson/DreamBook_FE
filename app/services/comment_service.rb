class CommentService
  class << self

    def conn
      Faraday.new(url: "http://localhost:5000/api/v1/")
    end

    def json_response(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_all_comments(blog_id)
      response = conn.get("blogs/#{blog_id}/comments")
      json_response(response)
      binding.pry
    end
  end
end
