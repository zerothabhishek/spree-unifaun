
## There is a _shipment_tracking partial too, 
## but it can't be used here because it displays nothing when the shipments are not trackable
## which is possible in our case as we are not asking the admin to set the tracking URL
## Tradeoff here is that unifaun tracking link will appear above the whole tracking block if there are any other shipments

Deface::Override.new(virtual_path:  "spree/shared/_order_details",
                     name:          "add_unifaun_tracking_to_order_details",
                     insert_after:  ".delivery",
                     partial:       "spree/shared/unifaun_shipment_tracking")
