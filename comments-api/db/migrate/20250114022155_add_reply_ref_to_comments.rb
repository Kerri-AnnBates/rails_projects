class AddReplyRefToComments < ActiveRecord::Migration[7.2]
  def change
    add_reference :comments, :reply, null: false, foreign_key: true, type: :uuid
  end
end
