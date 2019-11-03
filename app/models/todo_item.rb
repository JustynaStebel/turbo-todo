class TodoItem < ApplicationRecord
  validates_presence_of :content
end
