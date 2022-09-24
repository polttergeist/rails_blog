class Article < ApplicationRecord
  belongs_to :user, optional: true
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}

  scope :where_title_or_description_like, ->(snippet) do
    Article.where("title LIKE ?", "%" + Article.sanitize_sql_like(snippet) + "%").or(Article.where("description LIKE ?", "%" + Article.sanitize_sql_like(snippet) + "%"))
  end
end
