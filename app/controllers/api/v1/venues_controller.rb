class Api::V1::VenuesController < ApplicationController

  def show
    @venue = Venue.find(params[:id])
    render json: VenueSerializer.new(@venue).serializable_hash.to_json
  end
  
end
