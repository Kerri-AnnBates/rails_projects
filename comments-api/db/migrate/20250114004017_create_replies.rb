class CreateReplies < ActiveRecord::Migration[7.2]
  def change
    create_table :replies, id: :uuid do |t|
      t.timestamps
      t.string :content
      t.integer :score
      t.string :reply_to
      t.uuid :parent_id
      t.uuid :account_id
    end
  end
end
