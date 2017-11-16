Rails.application.routes.draw do
  resources :trails
  root to: "trails#index"
end
