class RemoveEndTimesFromUserAvailabilities < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_availabilities, :end_time, :datetime
  end
end
