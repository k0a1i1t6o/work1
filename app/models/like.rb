class Like < ApplicationRecord
  belongs_to :user
  belongs_to :goalpost, counter_cache: :likes_count
end
