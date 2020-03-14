require 'rails_helper'

RSpec.describe Api::V1::GachasController, type: :request do
  let(:guild) { create(:guild) }
  let(:gacha) { create(:gacha, guild: guild, key_name: 'key') }
  let(:json) { JSON.parse(response.body) }
  let(:params) do
    {
      name: 'Gacha Name',
      key_name: 'new_gacha',
      guild_id: guild.discord_id
    }
  end

  describe 'GET #index' do
    before do
      create(:gacha)
      create_list(:gacha, 2, guild: guild)
      get '/api/v1/gachas/', params: { guild_id: guild.discord_id }
    end

    it 'fetches all gachas of a guild' do
      expect(json['gachas'].count).to eq(2)
    end
  end

  describe 'GET #show' do
    before do
      get "/api/v1/gachas/#{gacha.key_name}",
          params: { guild_id: guild.discord_id }
    end

    it 'fetches a record' do
      expect(json['gacha']).to be_present
    end
  end

  describe 'POST #create' do
    context 'when params are valid' do
      before do
        post '/api/v1/gachas',
             params: params
      end

      it 'saves the record' do
        expect(Gacha.count).to eq(1)
      end
    end

    context 'when params are invalid' do
      before do
        post '/api/v1/gachas', params: { guild_id: guild.discord_id }
      end

      it 'does not save the record' do
        expect(Gacha.count).to eq(0)
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      delete "/api/v1/gachas/#{gacha.key_name}",
             params: { guild_id: guild.discord_id }
    end

    it 'deletes the record' do
      expect(Gacha.find_by(id: gacha.id)).not_to be_present
    end
  end
end
