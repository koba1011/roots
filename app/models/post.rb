class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :video

  validates :caption, presence: true
end
