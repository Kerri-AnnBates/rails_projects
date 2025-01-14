class AddAccountRefToComments < ActiveRecord::Migration[7.2]
  def change
    add_reference :comments, :account, null: false, foreign_key: true, type: :uuid
  end
end
