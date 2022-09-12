class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
    respond_to do |format|
      format.html

      format.pdf do
        render pdf: "file_name", template: "articles/index", formats: [:html]
      end

      format.json do
        render template: "index"
      end

      format.xml do 
        render template: "index"
      end
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render "new"
    end
  end

  def show
    respond_to do |format|
      format.html

      format.pdf do
        render pdf: "file_name", template: "articles/show", formats: [:html]
      end

      format.json do
        render template: "show"
      end

      format.xml do 
        render template: "show"
      end
    end
  end

  def edit
  end

  def destroy
    @article.destroy
    redirect_to articles_path
    flash[:success] = "Article was deleted"
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was updated"
      redirect_to article_path(@article)
    else
      flash[:success] = "Article was not updated"
      render "edit"
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
