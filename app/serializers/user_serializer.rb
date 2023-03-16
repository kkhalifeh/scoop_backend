class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :username, :profile_picture_url

  def profile_picture_url
    object.profile_picture_url
  end
end
