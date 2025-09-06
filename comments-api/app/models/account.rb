class Account < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password
end
