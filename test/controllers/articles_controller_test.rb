require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get article" do
    article = articles(:one)
    get article_url(article)
    assert_response :success
  end
end
