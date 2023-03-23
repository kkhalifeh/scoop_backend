class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email
  has_many :lists, serializer: ListSerializer
end
