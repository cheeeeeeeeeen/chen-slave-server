class Permission < ApplicationRecord
  belongs_to :guild

  validates :key_names, :action_name, :feature_name,
            presence: true
  validates :action_name, uniqueness: { scope: [:guild_id, :feature_name] }
end
