Rails.application.routes.draw do

  resources :in_shopping_carts, only: [:create, :destroy]

  resources :attachments, only: [:new, :create, :destroy, :show]

  resources :products

  #controlador sigue: /:controller/:action
  get '/email/create'

  get "/carrito", to: "shopping_carts#show"
  get "/add/:product_id", as: :add_to_cart, to: "in_shopping_carts#create"
  get '/checkout', to: "payments#checkout"

  #custom_id
  #link del producto
  get '/descargar/:id', to: "links#download"
  #link por archivo del producto
  get '/donwloads/:id/archivo/:attachment_id', to: "links#download_attachment", as: :download_attachment
  get '/invalid', to: "welcome#unregistered"

  devise_for :users

  post "emails/create", as: :create_email
  post "/pagar", to: "payments#create"
  post "payments/cards", to: "payments#process_card"
  get "/ok", to: "welcome#payment_succed"

  get "/ordenes", to: "ordenes#index"

  authenticated :user do
  	root 'welcome#index'
  end

  unauthenticated :user do
  	devise_scope :user do
  		root 'welcome#unregistered', as: :unregistered_root
	  end
  end

  


end
