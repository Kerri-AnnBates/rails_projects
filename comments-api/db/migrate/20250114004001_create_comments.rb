class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments, id: :uuid do |t|
      t.timestamps
      t.string :content, null: false
      t.integer :score, default: 0, null: false
      t.integer :comment_type, default: 0, null: false

      t.references :account, foreign_key: true, type: :uuid, null: false
      t.references :parent, foreign_key: { to_table: :comments }, type: :uuid, null: true
    end
  end
end
