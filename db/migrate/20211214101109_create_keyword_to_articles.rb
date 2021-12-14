class CreateKeywordToArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :keyword_to_articles do |t|
      t.belongs_to :keyword
      t.belongs_to :article

      t.timestamps
    end
  end
end
