class SearchedBookFacade
  class << self
    def one_book_matching_searched_keyword(keyword)
      if SearchedBookService.get_all_keyword_matching_books(keyword)[:data].empty?
        keyword = '1947'
        parsed_json = SearchedBookService.get_all_keyword_matching_books(keyword)
        array_of_all_book_results = parsed_json[:data].map do |searched_book_data|
          SearchedBook.new(searched_book_data)
        end
        first_book = array_of_all_book_results.sort_by {|book| book.title}[0]
        return first_book
      else 
        parsed_json = SearchedBookService.get_all_keyword_matching_books(keyword)
        array_of_all_book_results = parsed_json[:data].map do |searched_book_data|
          SearchedBook.new(searched_book_data)
        end
        first_book = array_of_all_book_results.sort_by {|book| book.title}[0]
        return first_book
      end
    end
  end
end