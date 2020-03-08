require 'rails_helper'

RSpec.describe Guild, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:command_prefix) }
  end
end
