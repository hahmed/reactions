class ReactionsHelperTest < ActionView::TestCase
  test "should return the reaction" do
    assert_dom_equal %{<span class="card-link emoji_happy"><span class="text-muted">👍</span><span class="count text-muted" id="emoji_happy_count">0</span></span>},
      emoji_reaction('happy', '👍', 0)
  end
end
