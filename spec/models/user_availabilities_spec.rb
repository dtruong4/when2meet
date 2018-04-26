require 'rails_helper'

RSpec.describe UserAvailability, type: :model do
  let!(:user) { User.create(name: 'User', email: 'user1@test.com') }
  let!(:start) { DateTime.new(2001, 2, 3, 4) }
  let!(:finish) { DateTime.new(2001, 2, 3, 5) }
  let!(:final_time) { DateTime.new(2001, 2, 3, 4, 30) }
  let!(:event) { Event.create(title: 'Event', location: 'Some Place', start_time: start, end_time: finish) }
  let!(:user_availability) { UserAvailability.create(user: user, event: event, slot_time: final_time) }

  describe '#event' do
    it 'belongs to an event' do
      expect(user_availability.event).to eq(event)
    end
  end

  describe '#user' do
    it 'belongs to a user' do
      expect(user_availability.user).to eq(user)
    end
  end

   describe 'validations' do
    it 'is not valid if slot time is outside of event time range' do
      test_time = DateTime.new(2001, 2, 3, 5, 30)
      availability = UserAvailability.create(user: user, event: event, slot_time: test_time)
      availability.valid?
      expect(availability.errors.messages[:slot_time]).to include("must take place during event")
    end
  end
end
