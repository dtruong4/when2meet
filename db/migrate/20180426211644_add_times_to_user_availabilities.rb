class AddTimesToUserAvailabilities < ActiveRecord::Migration[5.1]
  def change
    add_column :user_availabilities, :slot_time, :datetime
  end
end
