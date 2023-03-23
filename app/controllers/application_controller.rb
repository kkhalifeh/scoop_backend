class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  before_action :set_current_user

  private

  def set_current_user
    auth_header = request.headers['Authorization']
    return render json: { message: 'Unauthorized' }, status: :unauthorized if auth_header.nil?
  
    if auth_header.start_with?('Bearer ')
      token = auth_header.split(' ').last
      decoded_token = FirebaseIdToken.new(token).decode
      user_id = decoded_token.first['user_id']
      user_email = decoded_token.first['email']
      @current_user = User.includes(:lists).find_by(email: user_email)
  
      if @current_user
        @current_user.update(uid: token)
      else
        @current_user = User.create(uid: token, email: user_email)
      end
  
      session[:current_user_id] = @current_user.id # Set the current user object in the session
    else
      render json: { message: 'Invalid token' }, status: :unauthorized
    end
  
    rescue JWT::DecodeError => e
      Rails.logger.error "Error decoding JWT: #{e.message}"
      render json: { message: 'Unauthorized' }, status: :unauthorized
    rescue ActiveRecord::RecordNotFound => e
      Rails.logger.error "Error finding user: #{e.message}"
      render json: { message: 'Unauthorized' }, status: :unauthorized
  end
  
  

  def current_user
    @current_user
  end
end
