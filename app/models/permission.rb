class Permission < ApplicationRecord
  belongs_to :guild

  validates :key_names, :feature_name, presence: true
  validates :action_name, uniqueness: { scope: [:guild_id, :feature_name] }

  validate :check_blacklisted_features

  before_save :process_special_key_names

  def process_special_key_names
    key_name_array = key_names.split(',')
    self.key_names = '' if key_name_array.include?('remove_all')
    true
  end

  def check_blacklisted_features
    if blacklisted_features.include?(feature_name)
      errors.add(:blacklist, 'is found')
      return false
    end
    true
  end

  def blacklisted_features
    %w[permission help invite]
  end
end
