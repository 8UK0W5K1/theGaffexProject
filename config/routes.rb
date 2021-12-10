Rails.application.routes.draw do
  get 'about_gaffex', to: 'static_pages#what_is_gaffex'
  get 'about_us', to: 'static_pages#about_us'
  get 'contact', to: 'static_pages#contact'
  root 'articles#index'

  resources :articles do
    resources :tags, only: %i[create destroy] 
  end
  
  resources :searches, only: %i[index]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
