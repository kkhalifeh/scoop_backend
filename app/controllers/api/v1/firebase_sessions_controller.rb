require 'firebase_helper'
require 'byebug'

class Api::V1::FirebaseSessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    firebase_id_token = params[:firebase_id_token]

    # Decode and validate the Firebase ID token
    payload = FirebaseHelper.validate_token(firebase_id_token)


    if payload
      # Extract the user's Firebase UID from the payload

      firebase_uid = payload['sub']

      # Find or create the user based on their Firebase UID
      user = User.find_by(firebase_uid: firebase_uid)
      user ||= User.create!(firebase_uid: firebase_uid, email: payload['email'])

      # Your logic for signing the user in, issuing a JWT, or other steps
      # ...

    else
      render json: { error: 'Invalid Firebase ID token' }, status: :unauthorized
    end
  end
end
