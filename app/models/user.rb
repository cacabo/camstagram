require 'bcrypt'

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :name, length: { minimum: 1 }
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 3 }
  has_many :followers, class_name: 'Followings', foreign_key: 'user_id'
  has_many :following, class_name: 'Followings', foreign_key: 'follower_id'
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  # users.password_hash in the database is a :string
  include BCrypt

  # modify the password method to be able to handle nil password_hash
  def password
    @password ||= Password.new(password_hash) unless password_hash.nil?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end