class Category < ApplicationRecord
  has_many :note_category_relations, dependent: :destroy
  has_many :notes, through: :note_category_relations

  validates :name, presence: true

  scope :id_is, -> id {
    where(id: id)
  }
end
