class SearchedMovie
  attr_reader :movie_api_id, :title, :description
  
  def initialize(data)
      @movie_api_id = data[:data][:id]
      @title = data[:data][:attributes][:title]
      @description = data[:data][:attributes][:description]
  end
end