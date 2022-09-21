class SearchedMovieFacade
  class << self
    def two_movies_matching_searched_keyword(keyword)
      parsed_json = SearchedMovieService.get_all_keyword_matching_movies(keyword)
      array_of_all_movie_results = parsed_json[:data].map do |searched_movie_data|
        SearchedMovie.new(searched_movie_data)
      end
      first_two_movies = array_of_all_movie_results.sort_by {|movie| movie.title}[0]
      return first_two_movies
    end
  end
end
