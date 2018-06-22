class CreatePublishers < ActiveRecord::Migration[5.2]
  def change
    create_table :publisers do |t|
      t.string :name
      t.integer :book_id
      t.integer :author_id
  end
end
