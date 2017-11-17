Rails.application.routes.draw do
  get '/trails/addicks', to: 'trails#addicks'
  get '/trails/barker', to: 'trails#barker'

  resources :trails
  root to: "trails#home"
end
