module Api
  module V1
    class ItemsController < ApplicationController
      def create
        new_item = gacha&.items&.new(item_params)
        if new_item&.save
          render json: { item: new_item }
        else
          render json: { item: 'error' }
        end
      end

      def destroy
        if item&.destroy
          render json: { item: 'destroyed' }
        else
          render json: { item: 'error' }
        end
      end

      private

      def gacha
        @gacha ||= guild.gachas.find_by(key_name: params[:key_name])
      end

      def item
        @item ||= gacha&.items&.find_by(name: params[:name])
      end

      def item_params
        params.permit(:name, :chance)
      end
    end
  end
end
