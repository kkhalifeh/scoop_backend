require "test_helper"

class Api::V1::FirebaseSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_firebase_sessions_create_url
    assert_response :success
  end
end
