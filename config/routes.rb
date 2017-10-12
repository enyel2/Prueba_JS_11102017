Rails.application.routes.draw do

  resources :companies  do
  	resources :comments, only: [:create, :destroy]
  end


  root 'companies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
