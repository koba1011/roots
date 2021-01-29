class Post < ApplicationRecord
  geocoded_by :place
  after_validation :geocode, if: :place_changed?

  belongs_to :user
  has_one_attached :video
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :caption, presence: true

  def self.search(search)
    if search != ""
      Post.where( 'caption LIKE ? OR place LIKE ?', "%#{search}%", "%#{search}%" )
    else
      Post.all
    end
  end
end
