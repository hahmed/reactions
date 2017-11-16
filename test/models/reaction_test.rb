require 'test_helper'

class ReactionTest < ActiveSupport::TestCase
  test "should report error" do
    assert_raises(NameError) do
      some_undefined_variable
    end
  end
  
  test "should not save empty reaction" do
    reaction = Reaction.new
    assert_not reaction.save
  end

  test "should not save reaction if type is incorrect" do
    article = articles(:one)
    reaction = Reaction.new(article_id: article.id, reaction_type: 'Something')
    assert_not reaction.save
  end

  test "should not save reaction if no content" do
    article = articles(:one)
    reaction = Reaction.new(article_id: article.id, reaction_type: 'emoji', content: '')
    assert_not reaction.save
  end

  test "should not save reaction if emoji content is not valid" do
    article = articles(:one)
    reaction = Reaction.new(article_id: article.id, reaction_type: 'emoji', content: 'sleep')
    assert_not reaction.save
  end

  test "should save reaction successfully" do
    article = articles(:one)
    reaction = Reaction.new(article_id: article.id, reaction_type: 'emoji', content: 'lol')
    assert reaction.save
  end
end
