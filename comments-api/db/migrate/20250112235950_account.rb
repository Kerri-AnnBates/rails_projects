class Account < ActiveRecord::Migration[7.2]
  def change
    create_table :accounts, id: :uuid do |t|
      t.timestamps
      t.string :username
      t.string :image
      t.integer :account_id
    end
  end
end
