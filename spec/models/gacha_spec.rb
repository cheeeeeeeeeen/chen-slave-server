require 'rails_helper'

RSpec.describe Gacha, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:key_name) }
    it { is_expected.to validate_uniqueness_of(:key_name).scoped_to(:guild_id) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:guild) }
  end
end
