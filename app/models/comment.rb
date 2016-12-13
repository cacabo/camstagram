class Comment < ActiveRecord::Base
  validates :body, presence: true
  validates :body, length: { maximum: 80 }

  belongs_to :user
  belongs_to :post
end
