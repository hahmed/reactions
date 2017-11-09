require 'test_helper'

class ReactionsControllerTest < ActionDispatch::IntegrationTest
  test "should save reaction" do
    article = articles(:one)
    post article_reactions_url(article), params: {  }
    assert_response :success
  end
end
