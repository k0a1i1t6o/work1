class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :goalpost
    validates :content, presence: true
end
