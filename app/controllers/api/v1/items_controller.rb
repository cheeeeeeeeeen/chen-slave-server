module Api
  module V1
    class ItemsController < ApplicationController
      def create
        new_item = gacha.items.new(item_params)
        if new_item.save
          render json: { item: new_item }
        else
          render json: {
            error: '002',
            message: 'cannot save the item due to invalid params'
          }
        end
      end

      def destroy
        item.destroy
        render json: { item: 'destroyed' }
      end

      private

      def guild
        @guild ||= Guild.find_by(discord_id: params[:guild_id])
      end

      def gacha
        @gacha ||= guild.gachas.find_by(key_name: params[:key_name])
      end

      def item
        @item ||= gacha.items.find_by(name: params[:name])
      end

      def item_params
        params.permit(:name, :chance)
      end
    end
  end
end
