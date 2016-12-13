class Comment < ActiveRecord::Base
  validates :body, length: { maximum: 40 }

  belongs_to :user
  belongs_to :post
end
