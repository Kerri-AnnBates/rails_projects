class AddAccountRefToReplies < ActiveRecord::Migration[7.2]
  def change
    add_reference :replies, :account, null: false, foreign_key: true, type: :uuid
  end
end
