class Comment < ApplicationRecord
	belongs_to :user # Each comment belongs to a single user
  belongs_to :task # Each comment belongs to a single task
  validates :body, presence: true, length: { maximum: 100 }
end
