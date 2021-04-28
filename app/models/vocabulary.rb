class Vocabulary < ApplicationRecord
  belongs_to :book

  validates :word, presence: true
  validates :meaning, presence: true
end
