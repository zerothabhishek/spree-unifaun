Spree::Core::Engine.routes.append do
  namespace :admin do
    resources :order do
      resources :shipments
    end
  end

  get '/shipments/:number/track' => 'Shipments#track', as: :track_shipment
end
