Rails.application.routes.draw do

  resources :products,  only: [:index]
  resources :cartitems, only: [:create]

end
