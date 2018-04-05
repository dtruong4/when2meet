class CreateUserAvailabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :user_availabilities do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
    end
  end
end
