# frozen_string_literal: true

module ResponseHelper
  def respond_unauthorized(message)
    render json: { message: message }, status: :unauthorized
  end

  def respond_accepted(data)
    render json: data, status: :accepted
  end

  def respond_not_acceptable(_message)
    render json: { message: 'failed to create user' }, status: :not_acceptable
  end

  def respond_successful_creation(message, data)
    render json: { message: message, data: data }, status: :created
  end

  def respond_action_success(message, data)
    render json: { message: message, data: data }, status: :ok
  end

  def respond_action_failure(message, error)
    render json: { message: message, error: error }, status: :internal_server_error
  end

  def respond_not_found(message)
    render json: { message: message }, status: :not_found
  end
end
