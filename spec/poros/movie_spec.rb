require 'rails_helper'

RSpec.describe SearchedMovie do
  it 'exists and has attributes' do
    data = {
      :data=>
      [{:id=>925813, 
        :type=>"movie", 
        :attributes=>{:title=>"Lot Lizards", :description=>"Four truck stop prostitutes overthrow their pimp, and decide to take what they want by any means necessary."}}
      ]
    }

    movie_matching_keyword = SearchedMovie.new(data)
    expect(movie_matching_keyword).to be_a SearchedMovie
    expect(movie_matching_keyword.id).to eq(data[:data][:id])
    expect(movie_matching_keyword.title).to eq(data[:data][:attributes][:title])
    expect(movie_matching_keyword.description).to eq(data[:data][:attributes][:description])
  end
end