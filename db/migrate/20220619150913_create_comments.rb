class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :comment_body, limit: 4294967295
      t.integer :review_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
