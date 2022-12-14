# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :authorized

  include ResponseHelper

  def current_user
    @current_user ||= (User.find(session[:user_id]) if session[:user_id])
  end
end
