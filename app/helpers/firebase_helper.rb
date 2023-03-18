require 'google/apis/oauth2_v2'

module FirebaseHelper
  def validate_token(token)
    oauth_client = Google::Apis::Oauth2V2::Oauth2Service.new
    oauth_client.authorization = Google::Auth.get_application_default(["https://www.googleapis.com/auth/userinfo.email"])
    
    begin
      id_info = oauth_client.tokeninfo(id_token: token)
      if id_info.audience != Rails.application.credentials.firebase[:client_id]
        raise "Invalid audience"
      end
      id_info
    rescue Google::Apis::Error => e
      Rails.logger.error "Cannot validate token: #{e.message}"
      nil
    end
  end
end
