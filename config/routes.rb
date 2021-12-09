Rails.application.routes.draw do
  root 'articles#index'

  resources :articles do
    resources :tags, only: %i[create destroy] 
  end
  
  resources :searches, only: %i[index]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
