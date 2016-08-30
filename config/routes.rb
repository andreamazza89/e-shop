Rails.application.routes.draw do

  resources :products,  only: [:index]
  resources :cartitems, only: [:create, :destroy]
  resources :vouchers,  only: [:create]

end
