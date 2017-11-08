class NewsController < ApplicationController
  include TimesWire

  # PATCH /news/create
  # Get 3 latest news articles from nyc times
  def create
     Item.latest('nyt', 3).each do |item|
       News.create(
         title: item.title,
         abstract: item.abstract,
         section: item.section,
         url: item.url,
         author: item.byline,
         published_date: item.published_date,
         source: item.source
      )
     end
     redirect_to root_url
  end
end
