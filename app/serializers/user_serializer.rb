class UserSerializer
  include FastJsonapi::ObjectSerializer

  set_type :user

  attributes :email, :username, :first_name, :last_name, :mobile_number, :uid, :firebase_uid

  has_many :lists, record_type: :list, serializer: ListSerializer
end
