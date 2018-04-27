class AddWeekdayToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :weekday, :string
  end
end
