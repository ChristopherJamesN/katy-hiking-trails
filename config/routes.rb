Rails.application.routes.draw do
  devise_for :users
  get '/trails/addicks', to: 'trails#addicks'
  get '/trails/barker', to: 'trails#barker'

  resources :trails
  root to: "trails#home"
end
