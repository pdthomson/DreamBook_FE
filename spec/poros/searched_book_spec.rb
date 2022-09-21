require 'rails_helper'

RSpec.describe SearchedBook do
  it 'exists and has attributes' do
    data = {
      :id=>"8",
        :type=>"book",
        :attributes=>{:title=>"I Like Turtles", :author=>"Parker T."}
    }

    book_matching_keyword = SearchedBook.new(data)

    expect(book_matching_keyword).to be_a SearchedBook
    expect(book_matching_keyword.id).to eq(data[:id])
    expect(book_matching_keyword.title).to eq(data[:attributes][:title])
    expect(book_matching_keyword.author).to eq(data[:attributes][:author])
  end
end
