module ReactionsHelper
  def emoji_reaction(state, emoji, count)
    content_tag :span, :class => ('card-link emoji_' + state) do
      content_tag(:span, emoji, class: 'text-muted') +
      content_tag(:span, count, class: 'count text-muted', id: 'emoji_' + state + '_count')
    end
  end
end
