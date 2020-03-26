module Api
  module V1
    class GuildsController < ApplicationController
      def index
        guilds = Guild.all
        render json: { guilds: guilds }
      end

      def show
        render json: { guild: guild }
      end

      def modify_prefix
        guild.update(guild_params)
        render json: { guild: guild }
      end

      private

      def guild_params
        params.permit(:command_prefix)
      end
    end
  end
end
