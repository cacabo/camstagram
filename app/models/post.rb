class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  scope :posts_of_followings, -> (following_users) { where user_id: following_users }
end
