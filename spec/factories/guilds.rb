FactoryBot.define do
  factory :guild do
    discord_id { SecureRandom.hex }
    command_prefix { '...' }
  end
end
