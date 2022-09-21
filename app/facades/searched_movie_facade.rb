class SearchedMovieFacade
  class << self
    def one_movie_matching_searched_keyword(keyword)
      if SearchedMovieService.get_all_keyword_matching_movies(keyword)[:data].blank?
        keyword = 'Hobbit'
        parsed_json = SearchedMovieService.get_all_keyword_matching_movies(keyword)
        array_of_all_movie_results = parsed_json[:data].map do |searched_movie_data|
          SearchedMovie.new(searched_movie_data)
        end
        first_movie = array_of_all_movie_results.sort_by {|movie| movie.title}[0]
        return first_movie
      else 
        parsed_json = SearchedMovieService.get_all_keyword_matching_movies(keyword)
        array_of_all_movie_results = parsed_json[:data].map do |searched_movie_data|
          SearchedMovie.new(searched_movie_data)
        end
        first_movie = array_of_all_movie_results.sort_by {|movie| movie.title}[0]
        return first_movie
      end
    end
  end
end