class Gacha < ApplicationRecord
  belongs_to :guild
  has_many :items, dependent: :destroy

  validates :name, :key_name, presence: true,
                              uniqueness: { scope: :guild_id }
end
