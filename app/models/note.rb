class Note < ApplicationRecord
  belongs_to :book
  has_many :note_category_relations
  has_many :categories, through: :note_category_relations
end
