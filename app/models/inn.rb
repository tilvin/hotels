class Inn < ApplicationRecord

  after_create :create_rooms

  has_many :rooms, dependent: :destroy

  mount_uploader :image, InnImageUploader

  validates :name, :room_count, presence: true

  private

  def create_rooms
    (1..room_count).to_a.each do |number|
      rooms.create(number: number)
    end
  end

end
