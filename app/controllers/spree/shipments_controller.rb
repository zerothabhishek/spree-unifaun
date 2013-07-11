module Spree
  class ShipmentsController < Spree::StoreController

    before_filter :check_authorization

    # GET /shipments/:id/track.json
    def track
      shipment = Spree::Shipment.find_by_number(params[:number])
      authorize! :read, current_user
      tracker = Spree::Unifaun::ShipmentTracker.new(shipment)
      response = tracker.track
      render json: response
    end
    
    
  end
end