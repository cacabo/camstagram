require 'bcrypt'

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :name, length: { minimum: 1 }
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 3 }
  has_many :followers, class_name: 'Following', foreign_key: 'user_id', dependent: :destroy
  has_many :following, class_name: 'Following', foreign_key: 'follower_id', dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  include BCrypt

  def add_follower(follower_id)
    this.followers << follower_id
  end

  def add_following(following_id)
    this.following << following_id
  end

  #def remove_follower(follower_id)
  #  this.followers.delete(follower_id)
  #end

  #def remove_following(following_id)
  #  this.following.delete(following_id)
  #end

  #def remove_follows
  #  this.followers.each do |id|
  #    this.remove_follower(id)
  #  end
  #  this.following.each do |id|
  #    this.remove_following(id)
  #  end
  #end

  #def followers_count
  #  @user.followers.length
  #end

  #def following_count()
  #  @user.following.length
  #end

  def password
    @password ||= Password.new(password_hash) unless password_hash.nil?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  private


end