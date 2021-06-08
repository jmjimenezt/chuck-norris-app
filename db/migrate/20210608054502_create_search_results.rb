class CreateSearchResults < ActiveRecord::Migration[6.1]
  def change
    create_table :search_results do |t|
      t.string :keywords
      t.string :categories
      t.boolean :random
      t.string :email

      t.timestamps
    end
  end
end
