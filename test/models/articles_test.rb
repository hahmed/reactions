require 'test_helper'

class ArticlesTest < ActiveSupport::TestCase
  test "should not save article without title" do
    article = Article.new
    assert_not article.save
  end

  test "should save article successfully" do
    article = Article.new(title: 'Something', url: 'https://example.com')
    assert article.save
  end
end
