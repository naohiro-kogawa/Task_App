class Task < ApplicationRecord
  default_scope -> { order(created_at: :desc) } #降順
  
  belongs_to :user
  
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { in: 5..300 }
end
