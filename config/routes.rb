Rails.application.routes.draw do
  resources :brands
  resources :sub_categories
  resources :categories
  resources :districts
  get 'home/home'
  root 'home#home'
  resources :cities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
