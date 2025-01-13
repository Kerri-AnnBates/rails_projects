class Reply < ActiveRecord::Migration[7.2]
  def change
    create_table :replies do |t|
      t.timestamps
      t.string :content
      t.integer :score
      t.string :reply_to
      t.integer :parent_id
      t.integer :account_id
    end
  end
end
