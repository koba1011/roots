class Post < ApplicationRecord
  geocoded_by :place
  after_validation :geocode, if: :place_changed?

  belongs_to :user
  has_one_attached :video
  has_many :comments, dependent: :destroy

  validates :caption, presence: true

  def self.search(search)
    if search != ""
      Post.where('caption LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
