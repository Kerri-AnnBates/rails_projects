class CreateReplies < ActiveRecord::Migration[7.2]
  def change
    create_table :replies, id: :uuid do |t|
      t.timestamps
    end
  end
end
