# frozen_string_literal: true

class ArticlesController < ApplicationController
  http_basic_authenticate_with name: 'dhh', password: 'secret', except: %i[index show]

  # @article -> instanzvariable eines controllers
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # new is mapped to the "new" view
  def new
    # Article.new instantiates a new Article Model Object
    @article = Article.new
  end

  # create is mapped to the "new article" form action in the "new" view
  def create
    @article = Article.new(article_params)

    # @article.save actually (tries to) save(s) the article in the database
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  # edit is mapped to the "edit" view
  def edit
    # get an instance of the article to be edited
    @article = Article.find(params[:id])
  end

  # update is mapped to the "edit article" form action in the "edit" view
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path, status: :see_other
  end

  # "strong parameter"

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
