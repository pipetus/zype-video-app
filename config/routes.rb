Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :videos
end
