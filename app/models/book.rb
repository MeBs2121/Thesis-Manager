class Book < ApplicationRecord
  belongs_to :user
  has_many :notes

  validates :title, presence:true
  validates :author, presence:true
  validates :main, presence:true
end
