class SearchController < ApplicationController
  def index
    snippet = params[:search]
    @results = Article.where_title_or_description_like(snippet)
    @count = @results.count
    @results = @results.paginate(page: params[:page], per_page: 5)
    render "articles/results"
  end
end
