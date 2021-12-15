class AddCategoryToArticle < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :category, index: true
  end
end
