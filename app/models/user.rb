class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :image
  has_many :posts
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  
  with_options presence: true do
    validates :name
    validates :user_name, format: { with: /\A[a-zA-Z0-9]+\z/, message: "Please type using half-width characters"}
  end
end
