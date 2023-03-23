class Api::V1::ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:show, :update, :destroy]

  def index
    @lists = User.includes(lists: [:list_items]).find(current_user.id).lists
    render json: ListSerializer.new(@lists, include: [:user]).serializable_hash.to_json
  end
  

  def show
    @list = List.includes(:user, list_items: [:category, :venue]).find(params[:id])
    render json: ListSerializer.new(@list, include: [:user]).serializable_hash.to_json
  end

  def create
    city = City.find_or_create_by(name: list_params[:city])
    @list = current_user.lists.new(name: list_params[:name], city: city)
    if @list.save
      render json: @list, status: :created
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def update
    city = City.find_or_create_by(name: list_params[:city])
    if @list.update(name: list_params[:name], city: city)
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    head :no_content
  end

  def pin
    current_user.pinned_lists << @list
    if current_user.save
      render json: { message: 'List pinned successfully' }, status: :ok
    else
      render json: current_user.errors, status: :unprocessable_entity
    end
  end

  def unpin
    current_user.pinned_lists.delete(@list)
    if current_user.save
      render json: { message: 'List unpinned successfully' }, status: :ok
    else
      render json: current_user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = current_user.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :city)
  end
end
