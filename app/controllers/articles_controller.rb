# frozen_string_literal: true

class ArticlesController < ApplicationController
  include LoggingModule
  before_action :set_article, only: %i[show edit update destroy]
  # http_basic_authenticate_with name: 'dhh', password: 'secret', except: %i[index show]

  # @article -> instanzvariable eines controllers
  def index
    @articles = if params[:keyword].present?
                  Article.search(params[:keyword])
                else
                  Article.all
                end
    log_debug('Articles Loaded')
    # 'now' lets flash show only for this action
    # flash.now[:notice] = "We have exactly #{@articles.size} articles available."
  end

  def show
    log_info("Viewed Article #{@article.title}")
  end

  # new is mapped to the "new" view
  def new
    # Article.new instantiates a new Article Model Object
    @article = Article.new
  end

  # create is mapped to the "new article" form action in the "new" view
  def create
    @article = ArticleCreator.new(article_params).create
    # @article.save actually (tries to) save(s) the article in the database
    if @article.save
      redirect_to @article, success: 'New article created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # edit is mapped to the "edit" view
  def edit; end

  # update is mapped to the "edit article" form action in the "edit" view
  def update
    if @article.update(article_params)
      redirect_to @article, success: 'Article successfully updated.'
    else
      render :edit, status: :unprocessable_entity, danger: 'Article was not updated.'
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, status: :see_other, success: 'Article successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  # allows custom behaviour instead of red screen of death shown to users
  rescue ActiveRecord::RecordNotFound
    # making use of custom logging module method
    log_error("Article not found - ID #{params[:id]}")
    redirect_to articles_path, alert: 'Article not found.'
  end

  # "strong parameter"
  def article_params
    params.require(:article).permit(:title, :body, :status, :keyword)
  end
end
