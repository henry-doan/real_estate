Rails.application.routes.draw do

  root 'sellers#index'

  resources :sellers do
    resources :houses
  end

  resources :addresses
end

