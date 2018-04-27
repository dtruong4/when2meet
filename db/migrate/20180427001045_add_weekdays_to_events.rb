class AddWeekdaysToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :sunday, :boolean
    add_column :events, :monday, :boolean
    add_column :events, :tuesday, :boolean
    add_column :events, :wednesday, :boolean
    add_column :events, :thursday, :boolean
    add_column :events, :friday, :boolean
    add_column :events, :saturday, :boolean
  end
end
