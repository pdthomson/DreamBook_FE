class SearchedBookService

  class << self
    def json_response(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_all_keyword_matching_books(keyword)
      response = conn.get("/api/v1/book_recommendations?keyword=#{keyword}")
      json_response(response)
    end
  end

  private
  def self.conn
    Faraday.new(url: ENV['API_URL'])
  end

end
