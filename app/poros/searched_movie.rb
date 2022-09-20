class SearchedMovie
  attr_reader :movie_api_id, :title, :description
  
  def initialize(data)
      @movie_api_id = data[:id]
      @title = data[:attributes][:title]
      @description = data[:attributes][:description]
  end
end