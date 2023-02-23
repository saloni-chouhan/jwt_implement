class AuthenticationController < ApplicationController
  before_action :authenticate_user, except: [:login]
  include JsonWebToken
  def login
    @user = User.find_by_user_name(params[:user_name])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      time = Time.now + 2.minutes.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.user_name }, status: :ok
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

end
