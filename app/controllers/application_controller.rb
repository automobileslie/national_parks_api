class ApplicationController < ActionController::API

    private

  def create_token(user)
    JWT.encode({ user_id: user.id }, hmac_secret, "HS256")
  end

  def hmac_secret
    ENV["SECRET"]
  end

  def logged_in_user_id
    begin
      token = request.headers["Authorization"]
      arrayForLogin = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
      arrayForLogin.first["user_id"]
    rescue 
      nil
    end
  end

  def valid_token_exists
    !!logged_in_user_id  
  end


end
