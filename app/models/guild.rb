class Guild < ApplicationRecord
  has_many :gachas, dependent: :destroy

  validates :command_prefix, presence: true

  alias_attribute :guild_id, :discord_id
end
