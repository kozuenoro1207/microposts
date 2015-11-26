class Micropost < ActiveRecord::Base
  belongs_to :user
  has_many :favorites , foreign_key: "micropost_id", dependent: :destroy
  has_many :users
  
  has_many :favorite_relationships, class_name: "Favorite", foreign_key: "micropost_id", dependent: :destroy
  has_many :favorite_users, through: :favorite_relationships
  
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
end