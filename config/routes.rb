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
  resources :profiles, only: %i[edit update show]
  resources :categories, only: %i[show]

  devise_scope :user do
    get 'profile/edit'    => 'devise/registrations#edit',   :as => :edit_user_registration
    get 'profile/cancel'  => 'devise/registrations#cancel', :as => :cancel_user_registration
  end
  
  devise_for :users,
             :path => '',
             :path_names => { :sign_in =>       'connecte-toi',
                              :sign_out =>      'se-déconnecter',
                              :sign_up =>       '',
                              :registration =>  'inscription',
                              :edit =>          'edit',
                              :cancel =>        'retour',
                              :confirmation =>  'vérification',
                              :password => 'mot-de-passe',                              
                              }
                                
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
