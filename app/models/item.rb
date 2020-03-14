class Item < ApplicationRecord
  belongs_to :gacha

  validates :name, presence: true,
                   uniqueness: { scope: :gacha_id }
  validates :chance, numericality: true

  alias_attribute :discord_id, :name
end
