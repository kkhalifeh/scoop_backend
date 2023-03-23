class Api::V1::UsersController < ApplicationController
  skip_before_action :set_current_user, only: [:create]
  
  before_action :set_user, only: [:show, :update, :change_password]

  def create
    @user = User.new(user_params)

    if @user.save
      render json: { user: @user }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @user = User.includes(lists: { list_items: :venue }).find(current_user.id)
    render json: UserSerializer.new(@user, include: [:lists, :'lists.list_items', :'lists.list_items.venue']).serializable_hash.to_json
  end
  
  
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :username, :firstName, :lastName, :mobile_number, :uid,:firebase_uid )
          .transform_keys { |key| key.to_s.gsub(/firstName/, 'first_name').gsub(/lastName/, 'last_name').to_sym }
  end
  

  
end
