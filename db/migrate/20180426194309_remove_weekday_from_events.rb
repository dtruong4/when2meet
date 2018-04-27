class RemoveWeekdayFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :weekday, :string
  end
end
