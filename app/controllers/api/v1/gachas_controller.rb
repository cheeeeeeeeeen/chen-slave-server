module Api
  module V1
    class GachasController < ApplicationController
      def index
        gachas = guild.gachas.order('name').all
        render json: { gachas: gachas }
      end

      def show
        render json: {
          gacha: gacha,
          items: gacha&.items&.order(chance: :desc, name: :asc)
        }
      end

      def create
        gacha = guild.gachas.new(gacha_params)
        if gacha.save
          render json: { gacha: gacha }
        else
          render json: { gacha: 'error' }
        end
      end

      def destroy
        if gacha&.destroy
          render json: { gacha: 'destroyed' }
        else
          render json: { gacha: 'error' }
        end
      end

      def upload
        service = Gacha::ProcessUploadService.new(guild, file_urls)
        service.perform
        render json: { gacha: 'processed' }
      end

      private

      def gacha_params
        params.permit(:key_name, :name)
      end

      def gacha
        @gacha ||= guild.gachas.find_by(key_name: params[:key_name])
      end

      def file_urls
        @file_urls ||= params[:file_urls]
      end
    end
  end
end
