class JsonWebToken
  # Secret key to sign and verify tokens
  SECRET_KEY = Rails.application.secret_key_base

  # Encodes the payload and sets an expiration time
  def self.encode(payload, exp = 24.hours.from_now) #tokenın 24 saat sonra gecersiz oluyor
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  # Decodes the token and handles errors
  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(decoded)
    rescue JWT::DecodeError
    nil
  end
end
