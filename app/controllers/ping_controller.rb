# frozen_string_literal: true

class PingController < ApplicationController
  skip_before_action :authorized
  def index; end
end
