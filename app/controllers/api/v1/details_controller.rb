module Api
  module V1
    class DetailsController < ApplicationController
      def show
        render json: {
          version: '1.2.0.2'
        }
      end
    end
  end
end
