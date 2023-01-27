Rails.application.routes.draw do
  # Payment routes for Stripe:
  get 'payments/index'
  get 'payments/success'
  get 'payments/canceled'
  post '/create-checkout-session' => 'payments#create'

  # Root
  root :to => 'pages#home'

  # Users
  resources :users, :only => [:new, :create, :index]

  # Grills
  resources :grills

  # Bookings
  resources :bookings
  post '/grills/:grill_id/book' => 'bookings#create', :as => 'book_grill'

  # Sessions
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
