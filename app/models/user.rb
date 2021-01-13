class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, uniqueness: true
  with_options presence: true do
    validates :name
    validates :user_name, format: { with: /\A[a-zA-Z0-9]+\z/, message: "Please type using half-width characters"}
  end
end
