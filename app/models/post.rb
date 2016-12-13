class Post < ActiveRecord::Base
  validates :caption, length: { maximum: 100 }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_attached_file :image, styles: {
    medium: '200x200#',
    large: '600x600#'
  }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  scope :posts_of_followings, -> (following_users) { where user_id: following_users }
end
