require 'rails_helper'

RSpec.describe Event, type: :model do
  let!(:start) { DateTime.new(2001, 2, 3, 4) }
  let!(:finish) { DateTime.new(2001, 2, 3, 5) }
  let!(:event) { Event.create(title: 'Event', location: 'Some Place', start_time: start, end_time: finish) }
  let!(:user) { User.create(name: 'User', email: 'user@test.com') }

  describe 'validations' do
    it 'is not valid without a title' do
      event = Event.new(location: 'Some Place', start_time: start, end_time: finish)
      event.valid?
      expect(event.errors.messages[:title]).to include("can't be blank")
    end

    it 'is not valid without an location' do
      event = Event.new(title: 'Event', start_time: start, end_time: finish)
      event.valid?
      expect(event.errors.messages[:location]).to include("can't be blank")
    end

    it 'is not valid without a start time' do
      event = Event.new(title: 'Event', location: 'Some Place', end_time: finish)
      event.valid?
      expect(event.errors.messages[:start_time]).to include("can't be blank")
    end

    it 'is not valid without an end time' do
      event = Event.new(title: 'Event', location: 'Some Place', start_time: start)
      event.valid?
      expect(event.errors.messages[:end_time]).to include("can't be blank")
    end

    it "is not valid if start time occurs after end time" do
      event = Event.new(title: 'Event', location: 'Some Place', start_time: finish, end_time: start)
      event.valid?
      expect(event.errors.messages[:start_time]).to include("must take place before ending time")
    end

    it 'is valid with correct data' do
      start2 = DateTime.new(2001, 2, 3, 7)
      finish2 = DateTime.new(2001, 2, 3, 9)
      expect(Event.new(title: 'Test', location: 'Test', start_time: start2, end_time: finish2).valid?).to be true
    end
  end
end
