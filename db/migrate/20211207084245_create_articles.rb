class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.belongs_to :user
      t.string :title
      t.text :introduction
      t.text :protocol
      t.text :result
      t.text :conclusion
      t.text :references

      t.timestamps
    end
  end
end
