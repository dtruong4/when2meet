class UserAvailability < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validate :slot_time_is_between_event_time

  private

  def slot_time_is_between_event_time
    errors.add(:slot_time, 'must take place during event') if (slot_time <=> event.start_time) == -1 || (slot_time <=> event.end_time) >= 0
  end
end
