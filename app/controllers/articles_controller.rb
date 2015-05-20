class ArticlesController < ApplicationController

before_action :set_article, only: [:show, :edit, :update]
#after_action  -> { log_event(@category)} only: [:create]
after_action :log_event, only: [:create]
  def new
    @article = Article.new
  end


  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end

  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

private
  def set_article
  @article = Article.find(params[:id])
  end


  def article_params
  params.require(:article).permit(:title, :body, category_ids:[])
  end


end
