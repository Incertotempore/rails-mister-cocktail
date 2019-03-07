class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses, dependent: :delete_all
  validates :name, uniqueness: true, presence: true
end
