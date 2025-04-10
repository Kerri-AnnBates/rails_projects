class Account < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy

  validates :username, presence: true
end
