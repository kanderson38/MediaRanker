require "test_helper"

describe Work do
  before do
    @movie = works(:movie)
  end

  it "must be valid" do
    value(@movie).must_be :valid?
  end

  it "needs a title" do
    @movie.title = nil
    expect(@movie.valid?).must_equal false
    expect(@movie.errors.messages).must_include :title
  end

  it "needs a category" do
    @movie.category = nil
    expect(@movie.valid?).must_equal false
    expect(@movie.errors.messages).must_include :category
  end

  it "needs a creator" do
    @movie.creator = nil
    expect(@movie.valid?).must_equal false
    expect(@movie.errors.messages).must_include :creator
  end
end
