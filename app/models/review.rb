class Review < ApplicationRecord
  belongs_to :cocktail
  validates_inclusion_of :rating, :in => 1..5
  validates :content, presence: true, allow_blank: false

end
