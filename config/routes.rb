Rails.application.routes.draw do
  resources :trails
  root to: "trails#home"

  get '/trails/addicks', to: 'trails#addicks'
  get '/trails/barker', to: 'trails#barker'
end
