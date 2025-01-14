class CreateReplies < ActiveRecord::Migration[7.2]
  def change
    create_table :replies, id: :uuid do |t|
      t.timestamps
      t.string :content
      t.integer :score
      t.string :reply_to
    end
  end
end
