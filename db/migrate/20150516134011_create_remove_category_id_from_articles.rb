class CreateRemoveCategoryIdFromArticles < ActiveRecord::Migration
  def change
      remove_column :articles, :category_id
  end
end
