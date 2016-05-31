class User < ActiveRecord::Base
  FORMAT_USER_NAME = /\A\w+\z/
  MIN_LENGTH_USER_NAME = 6

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :user_name, presence: true, uniqueness: true,
            format: { with: FORMAT_USER_NAME }, length: { minimum: MIN_LENGTH_USER_NAME }

  validates :first_name, :last_name, presence: true

  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    where(warden_conditions.dup.to_h)
      .find_by(["username = :value OR email = :value", value: login])
  end
end
