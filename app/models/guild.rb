class Guild < ApplicationRecord
  validates :command_prefix, presence: true

  alias_attribute :guild_id, :discord_id
end
