class Guild < ApplicationRecord
  has_many :gachas, dependent: :destroy
  has_many :permissions, dependent: :destroy

  validates :command_prefix, presence: true
  validates :discord_id, presence: true, uniqueness: true

  alias_attribute :guild_id, :discord_id

  def self.create_rule(params_discord_id)
    create_with(
      command_prefix: '!'
    ).find_or_create_by(
      discord_id: params_discord_id
    )
  end
end
