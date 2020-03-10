require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should not save article without title" do
    article = Article.new
    assert_not article.save
  end

  test "should save article when body and title is present" do
    article = Article.new(title: "title", body: "Valid body")
    assert article.save
  end

  test "should not save article with too long title" do
    too_long_title = 'title' * 255
    article = Article.new(title: too_long_title, body: "Valid body")
    assert_not article.save
  end
end
