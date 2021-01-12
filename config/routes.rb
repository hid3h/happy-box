Rails.application.routes.draw do
  root to: 'top#index'
  get '/health', to: 'health#index'
  get '/auth/twitter/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/:screen_name', to: 'users#show'
end
