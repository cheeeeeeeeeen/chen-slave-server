class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  enum status: { active: 0, inactive: 1 }

  validates :discord_id, uniqueness: true, presence: true
end
