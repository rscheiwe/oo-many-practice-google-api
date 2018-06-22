class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.datetime :published_date
      t.integer :page_count
      t.string :description
      t.integer :isbn_13
  end
end
