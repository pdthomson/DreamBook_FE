class BlogService 

  class << self

    def conn 
      Faraday.new(url: "http://localhost:5000/api/v1/")
    end

    def json_response(response)
      JSON.parse(response.body, symbolize_names: true)
    end 

    def get_all_blogs
      response = conn.get('blogs')
      json_response(response)
    end
  end
end