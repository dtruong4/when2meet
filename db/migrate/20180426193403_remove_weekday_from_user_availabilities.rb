class RemoveWeekdayFromUserAvailabilities < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_availabilities, :weekday, :int
  end
end
