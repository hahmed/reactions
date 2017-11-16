require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get article" do
    article = articles(:one)
    get article_url(article)
    assert_response :success
  end

  test "should search articles" do
    get search_articles_url(q: 'test')
    assert_response :success
  end
end
