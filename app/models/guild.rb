class Guild < ApplicationRecord
  has_many :gachas, dependent: :destroy
  has_many :permissions, dependent: :destroy

  validates :command_prefix, presence: true
  validates :discord_id, presence: true, uniqueness: true

  alias_attribute :guild_id, :discord_id
end
