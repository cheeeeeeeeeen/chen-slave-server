class Gacha < ApplicationRecord
  belongs_to :guild

  validates :name, :key_name,
            presence: true,
            uniqueness: { scope: :guild_id }

  alias_attribute :discord_id, :key_name
end
