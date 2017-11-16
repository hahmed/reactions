# The reaction to the news
class Reaction < ApplicationRecord
  belongs_to :article
  scope :emojis, -> { where(reaction_type: 'emoji')}
  scope :comments, -> { where(reaction_type: 'text').order(created_at: :desc) }

  validates :content, presence: true, length: { minimum: 1 }

  validates :reaction_type, inclusion: { in: %w(emoji text),
    message: "%{value} is not a valid option" }

  validates :content, inclusion: { in: %w(thumbs_up thumbs_down lol hooray fear wave prayer),
    message: "%{value} is not a valid option" }, if: :emoji_reaction?

  def emoji_reaction?
    reaction_type == 'emoji'
  end
end
