class Comment < ApplicationRecord
  has_many :replies, dependent: :destroy

  validate :content, presence: true
end
