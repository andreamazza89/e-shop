Rails.application.routes.draw do

  root "products#index"

  resources :products,  only: [:index]
  resources :cartitems, only: [:create, :destroy]
  resources :vouchers,  only: [:create]

end
