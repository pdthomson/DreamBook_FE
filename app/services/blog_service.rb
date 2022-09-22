class BlogService

  class << self
    def conn 
      # Faraday.new(url: "https://fast-scrubland-25173.herokuapp.com")
      Faraday.new(url: ENV['API_URL'])
    end

    def json_response(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_all_blogs
      response = conn.get('/api/v1/blogs')
      json_response(response)
    end

    def send_blog(blog_params)
      response = conn.post('/api/v1/blogs', {
        title: blog_params[:title],
        body: blog_params[:body],
        user_id: blog_params[:user_id],
        status: blog_params[:status],
        keyword: blog_params[:keyword]
      }.to_json, "Content-Type" => "application/json")
      json_response(response)
    end

    def find_blog(blog_id)
      response = conn.get("/api/v1/blogs/#{blog_id}")
      json_response(response)
    end

    def revise_blog(blog_params)
      response = conn.patch("/api/v1/blogs/#{blog_params[:id]}", {
        title: blog_params[:title],
        body: blog_params[:body],
        # user_id: blog_params[:user_id],
        status: blog_params[:status],
        keyword: blog_params[:keyword]
      }.to_json, "Content-Type" => "application/json")
      json_response(response)
    end

    def delete_blog(blog_params)
      blog_id = blog_params[:id].to_i
      response = conn.delete("/api/v1/blogs/#{blog_id}")
    end

  end
end
