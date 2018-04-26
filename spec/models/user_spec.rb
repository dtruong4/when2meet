require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user1) { User.create(name: 'User1', email: 'user1@test.com') }
  let!(:user2) { User.create(name: 'User2', email: 'user2@test.com') }
  let!(:user3) { User.create(name: 'User3', email: 'user3@test.com') }
  let!(:user4) { User.create(name: 'User4', email: 'user4@test.com') }

  describe 'BCrypt' do
    it 'includes BCrypt' do
      expect(User.ancestors).to include(BCrypt)
    end

    it 'has a #password method' do
      expect(User.public_instance_methods).to include(:password)
    end

    it 'has a #password= method' do
      expect(User.public_instance_methods).to include(:password=)
    end

    it 'does not have a password column' do
      expect(ApplicationRecord.connection.column_exists?(:users, :password)).to be false
    end

    it 'does have a password_hash column' do
      expect(ApplicationRecord.connection.column_exists?(:users, :password_hash)).to be true
    end
  end

  describe 'validations' do
    it 'is not valid without a name' do
      user = User.new
      user.valid?
      expect(user.errors.messages[:name]).to include("can't be blank")
    end

    it 'is not valid without an email' do
      user = User.new
      user.valid?
      expect(user.errors.messages[:email]).to include("can't be blank")
    end

    it 'is not valid with a duplicate email' do
      user = User.new(email: 'user1@test.com')
      user.valid?
      expect(user.errors.messages[:email]).to include('has already been taken')
    end

    it "is not valid if the email does not have an '@'" do
      user = User.new(email: '.')
      user.valid?
      expect(user.errors.messages[:email]).to include("must have an '@' and a '.'")
    end

    it "is not valid if the email does not have a '.'" do
      user = User.new(email: '@')
      user.valid?
      expect(user.errors.messages[:email]).to include("must have an '@' and a '.'")
    end

    it "is not valid if the email does not have an '@' and a '.'" do
      user = User.new(email: 'email')
      user.valid?
      expect(user.errors.messages[:email]).to include("must have an '@' and a '.'")
    end

    it 'is valid with correct data' do
      expect(User.new(name: 'User5', email: 'user5@test.com').valid?).to be true
    end
  end
end
