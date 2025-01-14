class Reply < ApplicationRecord
  belongs_to :account
  belongs_to :comment

  validate :content
end
