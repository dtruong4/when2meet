class RemoveStartTimeFromUserAvailabilities < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_availabilities, :start_time, :datetime
  end
end
