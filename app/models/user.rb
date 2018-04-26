require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  has_many :user_availabilities, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validate :email_must_be_proper

  def password
    @password ||= Password.new(password_hash) if password_hash
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  private

  def email_must_be_proper
    errors.add(:email, "must have an '@' and a '.'") unless email.nil? || email.include?('@') && email.include?('.')
  end
end
