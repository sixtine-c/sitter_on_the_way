class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  require 'open-uri'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings

  validates :email, presence: true, uniqueness: true
  has_one_attached :photo

  after_create :create_photo

  def create_photo
    unless photo.attached?
      file = URI.open('https://source.unsplash.com/collection/332024/1600x900')
      photo.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
    end
  end
end
