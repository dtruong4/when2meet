class RemoveTimesFromUserAvailabilities < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_availabilities, :slot_time, :datetime
  end
end
