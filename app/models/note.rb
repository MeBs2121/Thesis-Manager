class Note < ApplicationRecord
  belongs_to :book
  has_many :note_category_relations, dependent: :destroy
  has_many :categories, through: :note_category_relations

  validates :title, presence: true
  validates :body, presence: true
  validates :page, presence: true

end
