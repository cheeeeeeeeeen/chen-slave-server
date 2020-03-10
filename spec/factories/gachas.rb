FactoryBot.define do
  factory :gacha do
    guild

    sequence(:name) { |n| "Gacha \##{n}" }
    sequence(:key_name) { |n| "gacha_#{n}" }
  end
end
