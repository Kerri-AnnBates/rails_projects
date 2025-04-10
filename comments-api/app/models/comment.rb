class Comment < ApplicationRecord
  enum comment_type: { comment: 0, reply: 1 }

  belongs_to :account
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy

  validates :content, presence: true
end
