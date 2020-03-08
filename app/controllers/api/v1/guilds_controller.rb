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
        if guild.blank?
          @guild = Guild.create(guild_params)
        else
          guild.update(guild_params)
        end
        render json: {
          guild: guild
        }
      end

      private

      def guild
        @guild ||= Guild.find_by(discord_id: params[:guild_id])
      end

      def guild_params
        params.permit(:guild_id, :command_prefix)
      end
    end
  end
end
