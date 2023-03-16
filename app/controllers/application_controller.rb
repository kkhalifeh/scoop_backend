class ApplicationController < ActionController::API
        include ActionController::MimeResponds
      
        before_action :authenticate_user!
      
        private
      
        def authenticate_user!
          token = request.headers['Authorization']
          return render json: { message: 'Unauthorized' }, status: :unauthorized if token.nil?
      
          begin
            decoded_token = FirebaseHelper.verify_id_token(token)
            user = User.find_or_create_by(firebase_id: decoded_token['uid'])
            @current_user = user
          rescue => e
            Rails.logger.error "Error authenticating user: #{e.message}"
            render json: { message: 'Unauthorized' }, status: :unauthorized
          end
        end
      
        def current_user
          @current_user
        end
      end
      