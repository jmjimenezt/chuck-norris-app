class CreateJokes < ActiveRecord::Migration[6.1]
  def change
    create_table(:jokes, id: :string) do |t|
      t.string :url
      t.string :icon_url
      t.string :value
      t.string :categories

      t.timestamps
    end
  end
end
