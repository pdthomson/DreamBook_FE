class CommentService
  class << self

    def conn
      # Faraday.new(url: "https://fast-scrubland-25173.herokuapp.com")
      Faraday.new(url: ENV['API_URL'])
    end

    def json_response(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_all_comments(blog_id)
      response = conn.get("/api/v1/blogs/#{blog_id}/comments")
      json_response(response)
    end
  end
end
