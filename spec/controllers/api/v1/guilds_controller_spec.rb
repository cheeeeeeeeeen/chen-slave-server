require 'rails_helper'

RSpec.describe Api::V1::GuildsController, type: :request do
  let(:guild) { create(:guild) }
  let(:json) { JSON.parse(response.body) }
  let(:new_params) do
    {
      guild_id: 'keklords',
      command_prefix: 'lul'
    }
  end
  let(:params) do
    {
      guild_id: 'exists',
      command_prefix: 'newprefix'
    }
  end

  describe 'GET #index' do
    before do
      create_list(:guild, 3)
      get '/api/v1/guilds'
    end

    it 'fetches all guilds' do
      expect(json['guilds'].count).to eq(3)
    end
  end

  describe 'GET #show' do
    before { get "/api/v1/guilds/#{guild.discord_id}" }

    it 'fetches a record' do
      expect(json['guild']).to be_present
    end
  end

  describe 'POST #modify_prefix' do
    context 'when guild is not yet saved' do
      before do
        post '/api/v1/guilds/modify_prefix',
             params: new_params
      end

      it 'saves the record' do
        expect(Guild.count).to eq(1)
      end
    end

    context 'when guild is already saved' do
      let(:guild) { create(:guild, discord_id: 'exists') }

      before do
        guild
        post '/api/v1/guilds/modify_prefix',
             params: params
      end

      it 'updates the prefix' do
        expect(guild.reload.command_prefix).to eq('newprefix')
      end
    end
  end
end
