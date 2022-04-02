class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :profile_image_id, ProfileimageUploader
  has_many :rooms, dependent: :destroy
  has_many :resavations, dependent: :destroy

  validates :username, presence: {message: 'を入力してください'}
end
