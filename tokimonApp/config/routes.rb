Rails.application.routes.draw do
  get '/tokimons/random', to: 'tokimons#random', as: 'random_tokimon'
  resources :trainers
  resources :tokimons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
