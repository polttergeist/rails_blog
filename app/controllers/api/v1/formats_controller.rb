module Api
  module V1
    class FormatsController < ApplicationController
      skip_forgery_protection
      before_action :set_article, only: [:update, :show, :destroy]

      def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
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
        @article.save ? head(:created) : head(:bad_request)
      end

      def update
        if @article.user_id.nil?
          @article.update(article_params) ? head(:ok) : head(:bad_request)
        else
          head :unauthorized
        end
      end

      def destroy
        if @article.user_id.nil?
          @article.destroy ? head(:ok) : head(:bad_request)
        else
          head :unauthorized
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
  end
end
