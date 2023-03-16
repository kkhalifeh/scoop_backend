class ListItemsController < ApplicationController
  before_action :set_list

  # GET /lists/:list_id/list_items
  def index
    render json: @list.list_items
  end

  # POST /lists/:list_id/list_items
  def create
    venue = find_or_create_venue(list_item_params[:venue_attributes])

    list_item = @list.list_items.build(list_item_params.except(:venue_attributes))
    list_item.venue = venue

    if list_item.save
      render json: list_item, status: :created
    else
      render json: list_item.errors, status: :unprocessable_entity
    end
  end

  # PUT /lists/:list_id/list_items/:id
  def update
    list_item = @list.list_items.find(params[:id])

    if list_item.update(list_item_params)
      render json: list_item
    else
      render json: list_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lists/:list_id/list_items/:id
  def destroy
    list_item = @list.list_items.find(params[:id])
    list_item.destroy

    head :no_content
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def list_item_params
    params.require(:list_item).permit(:category, :notes, venue_attributes: [:name, :address, :google_place_id, :phone_number, :website, :reservation_url, :image, :rating])
  end

  def find_or_create_venue(venue_params)
    venue = Venue.find_by(google_place_id: venue_params[:google_place_id])

    if venue.nil?
      venue = Venue.create(venue_params)
    end

    venue
  end
end
