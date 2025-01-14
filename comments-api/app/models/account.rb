class Account < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy

  validate :username, presence: true
end
