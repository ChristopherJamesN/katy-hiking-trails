Rails.application.routes.draw do
  get 'trails/favorite/:id', to: 'trails#favorite'
  get 'trails/remove/:id', to: 'trails#remove'
  get 'trails/favorites', to: 'trails#favorites'
  get '/trails/addicks', to: 'trails#addicks'
  get '/trails/barker', to: 'trails#barker'
  get '/trails/comment/:id', to: 'trail_users#update'

  post '/user_token' => 'user_token#create'

  scope '/api' do
    post '/register' => 'users#create'
    devise_for :users
    mount Knock::Engine => '/knock'
  end

  resources :charges
  resources :trails
  root to: "trails#home"
end
