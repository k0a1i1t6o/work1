class Goalpost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :from, presence: true, length: { maximum: 140 }

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
