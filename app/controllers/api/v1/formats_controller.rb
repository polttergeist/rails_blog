module Api
  module V1
class FormatsController < ApplicationController
  protect_from_forgery with: :null_session
  #skip_forgery_protection
  before_action :set_article, only: [:update, :show, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
    # binding.irb
    respond_to do |format|
      format.html do
        render template: "index", formats: [:json]
      end

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

  def show
    respond_to do |format|
      format.html do
        render template: "show", formats: [:json]
      end

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

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @article.user_id = 1 if @article.user_id.nil?
    if @article.save
      # 200 response
      head :ok
    else
      # error
      head :bad_request
    end
  end

  def update
    if @article.update(article_params)
      head :ok
    else
      head :bad_request
    end
  end

  def destroy
    head :ok if @article.destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
  end
  end