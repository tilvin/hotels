class Room < ApplicationRecord

  belongs_to :inn
  has_many :bookings, dependent: :destroy
  has_many :rooms, through: :bookings
  has_many :comments, dependent: :destroy

  scope :avaliable, -> { where is_free: true }
  scope :unavaliable, -> { where is_free: false }

end
