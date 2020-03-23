module Api
  module V1
    class PermissionsController < ApplicationController
      def create
        if permission.present?
          update_permission_process
        else
          new_permission_process
        end
      end

      def show
        render json: { key_names: permission&.key_names }
      end

      private

      def guild
        @guild ||= Guild.find_by(guild_id: params[:guild_id])
      end

      def permission
        @permission ||= guild.permissions.find_by(
          feature_name: params[:feature_name],
          action_name: params[:action_name]
        )
      end

      def permission_params
        params.permit(:feature_name, :action_name, :key_names)
      end

      def new_permission_process
        new_permission = guild.permissions.new(permission_params)
        if new_permission.save
          render json: { permission: new_permission }
        else
          render json: { permission: 'error' }
        end
      end

      def update_permission_process
        if permission.update(permission_params)
          render json: { permission: permission }
        else
          render json: { permission: 'error' }
        end
      end
    end
  end
end
