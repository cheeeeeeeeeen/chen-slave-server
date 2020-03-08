require 'rails_helper'

RSpec.describe Api::V1::ApplicationController, type: :request do
  it 'is loaded' do
    expect(described_class).to be_present
  end
end
