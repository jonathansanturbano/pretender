class Terrain < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4 }
  validates :price_cents, presence: true, numericality: { greater_than: 0, only_integer: true }
  belongs_to :user
  has_one_attached :image
end
