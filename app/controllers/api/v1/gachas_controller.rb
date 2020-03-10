module Api
  module V1
    class GachasController < ApplicationController
      def index
        gachas = guild.gachas.order('name').all
        render json: { gachas: gachas }
      end

      def show
        render json: { gacha: gacha }
      end

      def create
        gacha = guild.gachas.new(gacha_params)
        if gacha.save
          render json: { gacha: gacha }
        else
          render json: {
            error: '002',
            message: 'cannot save the gacha due to invalid params'
          }
        end
      end

      def destroy
        gacha.destroy
        render json: { gacha: 'destroyed' }
      end

      private

      def gacha_params
        params.permit(:key_name, :name)
      end

      def guild
        @guild ||= begin
          data = Guild.find_by(guild_id: params[:guild_id])
          data || render(json: {
                           error: '001',
                           message: 'guild_id does not exist in our database'
                         })
        end
      end

      def gacha
        @gacha ||= begin
          data = guild.gachas.find_by(key_name: params[:key_name])
          data || render(json: {
                           error: '003',
                           message: 'gacha data of this guild_id does not exist'
                         })
        end
      end
    end
  end
end
