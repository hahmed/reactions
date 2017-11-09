# The news article that we want reactions for
class Article < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true

  has_many :reactions
end
