# Show list of articles that you can react on
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
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
end
