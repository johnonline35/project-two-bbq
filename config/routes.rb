Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, :only => [:new, :create, :index]

  resources :grills

  resources :bookings

  post '/grills/:grill_id/book' => 'bookings#create', :as => 'book_grill'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
