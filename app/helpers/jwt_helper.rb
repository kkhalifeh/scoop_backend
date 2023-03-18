require 'jwt'

module JwtHelper
  SECRET_KEY = Rails.application.credentials.secret_key_base

  def self.encode_token(user)
    payload = { user_id: user.id }
    JWT.encode(payload, SECRET_KEY, 'HS256')
  end

  def self.decode_token(token)
    payload = JWT.decode(token, SECRET_KEY, true, { algorithm: 'HS256' })
    payload[0]
  rescue JWT::DecodeError => e
    puts "Cannot decode token: #{e}"
    nil
  end
end
