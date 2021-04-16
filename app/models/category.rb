class Category < ApplicationRecord
  has_many :note_category_relations
  has_many :notes, through: :note_category_relations
end
