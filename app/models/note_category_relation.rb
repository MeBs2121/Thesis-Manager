class NoteCategoryRelation < ApplicationRecord
  belongs_to :note
  belongs_to :category
end
