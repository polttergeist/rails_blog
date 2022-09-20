class AddIndexesToArticles < ActiveRecord::Migration[7.0]
  def change
    add_index :articles, :user_id
    add_index :articles, [:title, :description]
  end
end
