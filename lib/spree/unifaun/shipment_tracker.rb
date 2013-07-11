class Spree::Unifaun::ShipmentTracker
  include HTTParty
  base_uri 'pacsoftonline.com' ## https://www.pacsoftonline.com/ext.po.se.se.track?key=<user-id>&reference=<reference>

  def intialize(shipment)
    @shipment = shipment
    @order = @shipment.order
    @key = Spree::Unifaun::Config.preferred_quick_id_for_sender
    @reference = @order.number
  end

  def track
    options = {key: @key, reference: @reference}
    response = self.class.get('/ext.po.se.se.track', options)
    response.to_hash
  end

end