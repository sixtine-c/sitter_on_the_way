class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings

  validates :email, presence: true, uniqueness: true
  has_one_attached :photo

  # before_save :create_photo unless photo.attached?

  # def create_photo
  #   photo.attach(Cloudinary::Uploader.upload("https://source.unsplash.com/collection/332024/1600x900"))
  # end
end
