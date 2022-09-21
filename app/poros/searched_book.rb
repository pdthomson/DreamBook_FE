class SearchedBook
  attr_reader :id, :title, :author

  def initialize(data)
      @id = data[:id]
      @title = data[:attributes][:title]
      @author = data[:attributes][:author]
  end
end
