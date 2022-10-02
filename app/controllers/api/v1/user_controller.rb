# frozen_string_literal: true

module Api
  module V1
    class UserController < ApplicationController
      include AuthHelper

      def show
        @user = User.find(params[:id])
        if @user
          render json: @user, Serializer: UserSerializer, status: :ok
        else
          respond_not_found 'User not found'
        end
      end
    end
  end
end
