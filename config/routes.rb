Rails.application.routes.draw do
  devise_for :users

  get 'trails/favorite/:id', to: 'trails#favorite'
  get 'trails/remove/:id', to: 'trails#remove'
  get 'trails/favorites', to: 'trails#favorites'
  get '/trails/addicks', to: 'trails#addicks'
  get '/trails/barker', to: 'trails#barker'
  get '/trails/comment/:id', to: 'trail_users#update'

  resources :charges
  resources :trails
  root to: "trails#home"
end
