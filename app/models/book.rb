class Book < ApplicationRecord
  belongs_to :user
  has_many :notes
  has_many :vocabularies
  # has_one_attached :image

  validates :title, presence:true
  validates :author, presence:true, length: { within: 2..30 }

  # validate :image_presence
  #
  # def image_presence
  #   unless image.attached?
  #     errors.add(:image, 'must be attached')
  #   end
  # end
end
