# Record reactions against the article
class ReactionsController < ApplicationController
  before_action :find_article

  def create
    @reaction = @article.reactions.new(reaction_params)
    @reaction.reaction_type = 'text'

    respond_to do |format|
      if @reaction.save
        format.html { redirect_to article_url(@article), notice: 'Your reaction has been created successfully.' }
        format.js
        format.json { render json: @reaction, status: :created, location: @reaction }
      else
        format.html { redirect_to article_url(@article), error: 'Error saving your reaction.' }
        format.js
        format.json { render json: @reaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def react
    @reaction = @article.reactions.new(reaction_params)
    @reaction.reaction_type = 'emoji'

    respond_to do |format|
      if @reaction.save
        format.html { redirect_to article_url(@article), notice: 'Your reaction has been created successfully.' }
        format.js
        format.json { render json: @reaction, status: :created, location: @reaction }
      else
        format.html { redirect_to article_url(@article), error: 'Error saving your reaction.' }
        format.js
        format.json { render json: @reaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def find_article
      @article = Article.find(params[:article_id])
    end

    def reaction_params
      params.require(:reaction).permit(:content)
    end
end
