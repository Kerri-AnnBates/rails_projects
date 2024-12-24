class Comments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments, id: :uuid do |t|
      t.timestamps
      t.string :content, null: false
      t.integer :score, default: 0, null: false
    end
  end
end
