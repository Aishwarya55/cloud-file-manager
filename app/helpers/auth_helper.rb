# frozen_string_literal: true

module AuthHelper
  def encode_token(payload)
    exp = (Time.zone.now + 3.minutes).to_i
    JWT.encode({ data: payload, exp: exp }, 'ak_cloud_file_manager_s3cr3t')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decode_token
    if auth_header
      token = auth_header.split(' ')[1]
      JWT.decode(token, 'ak_cloud_file_manager_s3cr3t', true, algorithm: 'HS256')
    end
  end

  def authenticated_user
    if decode_token
      user_id = decode_token[0]['data']['user_id']
      session[:user_id] = user_id
      true
    else
      respond_unauthorized('Could not authorize user')
    end
  rescue JWT::ExpiredSignature
    respond_unauthorized 'Token expired!'
  rescue JWT::DecodeError
    false
  end

  def logged_in?
    !!authenticated_user
  end

  def authorized
    respond_unauthorized('User not logged in') unless logged_in?
  end
end
