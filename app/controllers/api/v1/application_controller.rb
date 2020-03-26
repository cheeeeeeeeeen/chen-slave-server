module Api
  module V1
    class ApplicationController < ActionController::API
      private

      def guild
        @guild ||= Guild.create_rule(params[:guild_id])
      end
    end
  end
end
