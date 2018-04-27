class AddWeekdayToUserAvailabilities < ActiveRecord::Migration[5.1]
  def change
    add_column :user_availabilities, :weekday, :int
  end
end
