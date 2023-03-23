class FirebaseIdToken
  def initialize(token)
    @token = token
  end

  def decode
    JWT.decode(@token, nil, false)
  end
end
