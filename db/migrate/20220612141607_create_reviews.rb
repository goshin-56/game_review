class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body, limit: 4294967295
      t.integer :game_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
