class TodoItem < ApplicationRecord
  validates_presence_of :content

  scope :order_by_completed, -> { order "completed_at DESC" }
end
