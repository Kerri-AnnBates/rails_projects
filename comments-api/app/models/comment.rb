class Comment < ApplicationRecord
  has_many :replies, dependent: :destroy
  belongs_to :account

  validate :content, presence: true
end
