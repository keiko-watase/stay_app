class Room < ApplicationRecord
  mount_uploader :room_image_id, RoomimageUploader
  attachment :room_image
  belongs_to :user
  has_many :resavations, dependent: :destroy

  validates :roomname, presence: true, length: {maximum:30}
  validates :roomintroduction, presence: true, length: {maximum:100}
  validates :fee, presence: true,numericality:{only_integer: true,greater_than_or_equal_to: 100, less_than_or_equal_to: 9999999}
  validates :adress, presence: true
  validates :room_image_id, presence:true
  
  def self.search(area)
    Room.where(['adress LIKE ?', "%#{area}%"]) 
  end 
   
  def self.search(key)
    Room.where(['roomname LIKE ? OR adress LIKE ? OR fee LIKE ? OR roomintroduction LIKE ?', "%#{key}%", "%#{key}%", "%#{key}%", "%#{key}%"]) 
  end
end
