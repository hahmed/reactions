# Show list of articles that you can react on
class ArticlesController < ApplicationController
  include TimesWire

  def show
    @article = Article.find(params[:id])
  end

  def search
    @search = params[:q]
    if @search
      @articles = Article.where("title iLIKE ?", "%#{@search}%")
    else
      @articles = Article.all
    end
  end

  # PATCH /news/create
  # Get 3 latest news articles from nyc times
  def create
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
     redirect_to root_url
  end
end
