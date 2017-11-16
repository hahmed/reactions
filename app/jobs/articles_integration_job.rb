# Get the latest articles from the TimesWire service
class ArticlesIntegrationJob < ApplicationJob
  include TimesWire

  queue_as :default

  def perform(*args)
    Item.latest('nyt', 3).each do |item|
      Article.create(
        title: item.title,
        abstract: item.abstract,
        section: item.section,
        url: item.url,
        author: item.byline,
        published_date: item.published_date,
        source: item.source
     )
    end
  end
end
