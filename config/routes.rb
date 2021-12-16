Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/unacceptable'
  get 'errors/internal_error'
  get 'about_gaffex', to: 'static_pages#what_is_gaffex'
  get 'about_us', to: 'static_pages#about_us'
  get 'contact', to: 'static_pages#contact'
  get 'help', to: 'static_pages#help'

  get "/404", to: 'errors#not_found'
  get "/422", to: 'errors#unacceptable'
  get "/500", to: 'errors#internal_error'

  root 'articles#index'


  resources :articles do
    resources :tags, only: %i[create destroy] 
  end

  resources :searches, only: %i[index]
  resources :profiles, only: %i[edit update show destroy]
  resources :categories, only: %i[show]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
