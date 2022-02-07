Rails.application.routes.draw do
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
  end

  get 'sessions/create'
  get 'sessions/destroy'

  resources :products do
    get :who_bought, on: :member
    resources :reviews
  end

  resources :support_requests, only: %i[index update]

  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    resources :users
    root 'store#index', as: 'store_index', via: :all
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
