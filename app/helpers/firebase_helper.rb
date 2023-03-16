require 'google/cloud/firestore'

module FirebaseHelper
  def self.verify_id_token(token)
    project_id = 'scoop-8baed' # Replace with your Firebase project ID

    firebase_app = Google::Cloud::Firestore.new project_id: project_id
    auth = firebase_app.app.auth
    auth.verify_id_token(token)
  end
end
