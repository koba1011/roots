class Post < ApplicationRecord
  
  geocoded_by :place
  after_validation :geocode, if: :place_changed?

  belongs_to :user
  has_one_attached :video
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  with_options presence: true do
    validates :caption
  end
  validate :video_or_youtube_url
  

  def self.search(search)
    if search != ""
      Post.where( 'caption LIKE ? OR place LIKE ?', "%#{search}%", "%#{search}%" )
    else
      Post.all
    end
  end

  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def video_or_youtube_url
    return if video.present? ^ youtube_url.present?
    errors.add(:base, 'ビデオまたはYoutube動画URLのどちらか一方を選択してください')
  end

end
