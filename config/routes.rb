Rails.application.routes.draw do

  root 'sellers#index'

  resources :sellers do
    resources :houses do
  		resources :addresses
  	end
	end
end

