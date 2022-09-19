class BlogService 

  class << self

    def conn 
      Faraday.new(url: "https://fast-scrubland-25173.herokuapp.com")
    end

    def json_response(response)
      JSON.parse(response.body, symbolize_names: true)
    end 

    def get_all_blogs
      response = conn.get('/api/v1/blogs')
      json_response(response)
    end

    def send_blog(blog_params)
      response = conn.post('blogs', {
        title: blog_params[:title],
        body: blog_params[:body],
        user_id: blog_params[:user_id],
        status: blog_params[:status]
      }.to_json, "Content-Type" => "application/json")
      
      json_response(response)
      
    end
  end
end