Rails.application.routes.draw do
  root to: 'top#index'
  get '/home', to: 'home#index'
  get '/health', to: 'health#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
