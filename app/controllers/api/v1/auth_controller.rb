class Api::V1::AuthController < ApplicationController

  skip_before_action :authorized, only: [:register, :login]

  include AuthHelper

  def register
    @user = User.new(user_login_params)

    @user.save!
    
    if @user.valid?
      respond_successful_creation('User created successfully', UserSerializer.new(@user))
    else
      respond_not_acceptable 'User invalid. Cannot create user'
    end
  end

  def login
    @user = User.find_by(email: user_login_params[:email])
    if @user && @user.authenticate(user_login_params[:password])
      token = encode_token({ user_id: @user.id })
      respond_accepted jwt: token
    else
      respond_unauthorized 'Invalid email or password'
    end
  end

  private

  def user_login_params
    params.require(:auth).permit(
      :email,
      :password
    )
  end
end
