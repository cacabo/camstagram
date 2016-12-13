require 'bcrypt'

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :name, length: { minimum: 1 }
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 2 }

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy
  has_many :following, through: :following_relationships, source: :following
  

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_attached_file :profile_picture, styles: {
    thumb: '50x50#',
    medium: '200x200#'
  }

  validates_attachment_content_type :profile_picture, content_type: /\Aimage\/.*\Z/

  include BCrypt

  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  def like_post(post_id)
    likes.create(post_id: post_id)
  end

  def unlike_post(post_id)
    likes.find_by(post_id: post_id).destroy
  end

  def password
    @password ||= Password.new(password_hash) unless password_hash.nil?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
