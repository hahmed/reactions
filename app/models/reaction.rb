# The reaction to the news
class Reaction < ApplicationRecord
  belongs_to :article
  validates :content, presence: true, length: { minimum: 1 }

  scope :emojis, -> { where(reaction_type: 'emoji')}
  scope :comments, -> { where(reaction_type: 'text').order(created_at: :desc) }
end
