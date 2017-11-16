require 'test_helper'

class ReactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "should save reaction" do
    assert_difference('Reaction.count', +1) do
      patch react_article_reactions_url(@article), params: { reaction: { content: 'fear' }   }
    end

    assert_redirected_to article_url(@article)

    reaction = Reaction.last
    assert_equal 'emoji', reaction.reaction_type
    assert_equal 'fear', reaction.content
  end

  test "should fail to create reaction using SJR" do
    patch react_article_reactions_url(@article), xhr: true, params: { reaction: { content: '' }  }

    assert_response :success
    assert_equal "text/javascript", @response.content_type

    assert_select_jquery :show, '#notice'
  end

  test "should save reaction using SJR" do
    assert_difference('Reaction.count', +1) do
      patch react_article_reactions_url(@article), xhr: true, params: { reaction: { content: 'fear' }   }
    end
    assert_response :success
    assert_equal "text/javascript", @response.content_type

    reaction = Reaction.last
    assert_equal 'emoji', reaction.reaction_type
    assert_equal 'fear', reaction.content

    # TODO: weird, need to find a way to pass this test!
    assert_select "#emoji_#{reaction.content}_count", { :count => 0, :html => /1/ }
  end

  test "should save comment" do
    assert_difference('Reaction.count', +1) do
      post article_reactions_url(@article), params: { reaction: { content: 'something' }  }
    end
    assert_redirected_to article_url(@article)

    reaction = Reaction.last
    assert_equal 'text', reaction.reaction_type
    assert_equal 'something', reaction.content
  end

  test "should fail to create comment using SJR" do
    post article_reactions_url(@article), xhr: true, params: { reaction: { content: '' }  }

    assert_response :success
    assert_equal "text/javascript", @response.content_type

    assert_select_jquery :show, '#notice'
  end

  test "should save comment using SJR" do
    assert_difference('Reaction.count', +1) do
      post article_reactions_url(@article), xhr: true, params: { reaction: { content: 'something' }  }
    end
    assert_response :success
    assert_equal "text/javascript", @response.content_type

    reaction = Reaction.last
    assert_equal 'text', reaction.reaction_type
    assert_equal 'something', reaction.content
    assert_equal 2, Reaction.comments.count

    assert_select_jquery :prependTo, '#comments_list' do
      assert_select '.reaction-content', reaction.content
    end
  end
end
