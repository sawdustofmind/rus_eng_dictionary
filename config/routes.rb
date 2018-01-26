Rails.application.routes.draw do
  devise_for :users
  resources :rus_translations, 
    only: [:index, :new, :create, :destroy]
  resources :vocabulary_tests,
    only: [:create, :index, :show, :destroy]
  resources :test_results,
    only: [:create, :index, :show, :destroy]
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
