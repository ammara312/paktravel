  Rails.application.routes.draw do
  # devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'register', to: 'devise/registrations#new', as: "new_user_registration"
    delete 'logout', to: 'devise/sessions#destroy'
  end

  devise_for :users, :controllers => { registrations: 'registrations' }

  #nested resources allow us to connect comments to products
  resources :products do
    resources :comments
  end
  resources :users
  # , only: [:new, :create, :edit, :update, :destroy]


  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #root 'static_pages#index'
  root 'static_pages#landing_page'
  
  post 'static_pages/thank_you'
#  get 'payments/create'
  post 'payments/create'
#  get 'product/index'
  resources :orders, only: [:index, :show, :create, :destroy]

  # get '/orders', to: 'orders#index'
  # get '/orders', to: 'orders#show'

  #for actiona
  mount ActionCable.server => '/cable'

end
  