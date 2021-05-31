class Note < ApplicationRecord
  belongs_to :book, dependent: :destroy
  has_many :note_category_relations, dependent: :destroy
  has_many :categories, through: :note_category_relations

  validates :title, presence: true
  validates :body, presence: true
  validates :page, presence: true

  scope :has_category_id, -> category_id {
    joins(:categories).merge(Category.id_is category_id)
  }
end
