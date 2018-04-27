class ChangeSlotTimeToBeDatetimeInUserAvailabilities < ActiveRecord::Migration[5.1]
  def change
    change_column :user_availabilities, :slot_time, :datetime
  end
end
