require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
    assert_equal "index", @controller.action_name
  end

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
