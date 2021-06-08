class CreateSearchResults < ActiveRecord::Migration[6.1]
  def change
    create_table :search_results do |t|
      t.string :keywords
      t.string :categories
      t.boolean :random
      t.string :email

      t.timestamps
    end

    create_table :jokes_search_results, id: false do |t|
      t.string :joke_id
      t.bigint :search_result_id
    end

    add_index :jokes_search_results, :joke_id
    add_index :jokes_search_results, :search_result_id
  end
end
