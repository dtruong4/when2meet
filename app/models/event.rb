class Event < ApplicationRecord
  has_many :user_availabilities, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances

  validates :title, presence: true
  validates :location, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :start_time_is_before_end_time

  private

  def start_time_is_before_end_time
    errors.add(:start_time, 'must take place before ending time') if (start_time <=> end_time) == 1
  end
end
