class ChangeCompletedToCompletedAt < ActiveRecord::Migration[6.0]
  def change
    remove_column :todo_items, :completed, :boolean
    add_column :todo_items, :completed_at, :datetime
  end
end
