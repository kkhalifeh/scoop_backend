class Api::V1::FirebaseSessionsController < ApplicationController
  def create
    firebase_id_token = params[:firebase_id_token]
    decoded_token = params[:decoded_token]

    # Since we're not verifying the token, we're using the decoded token received from the client
    payload = decoded_token

    if payload
      firebase_uid = payload['sub']

      user = User.find_by(uid: firebase_id_token)

      if user
        # User already exists, issue a JWT for the authenticated user
        jwt_payload = { user_id: user.id }
        secret_key = Rails.application.credentials.secret_key_base
        token = JWT.encode(jwt_payload, secret_key, 'HS256')
        render json: { token: token, user: user }
      else
        # User does not exist, prompt the client to sign up
        render json: { error: 'User not found. Please sign up to continue.' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Invalid Firebase ID token' }, status: :unauthorized
    end
  end
end
