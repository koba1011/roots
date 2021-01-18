class Post < ApplicationRecord
  geocoded_by :place
  after_validation :geocode, if: :place_changed?

  belongs_to :user
  has_one_attached :video
  has_many :comments

  validates :caption, presence: true
end
