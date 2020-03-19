class Item < ApplicationRecord
  belongs_to :gacha

  validates :name, presence: true,
                   uniqueness: { scope: :gacha_id }
  validates :chance, numericality: true
end
