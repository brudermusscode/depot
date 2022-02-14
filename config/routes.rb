Rails.application.routes.draw do
  resources :support_requests, only: %i[index update]

  scope '(:locale)' do
    # root
    root 'store#index', as: 'store_index', via: :all

    # admin overview pages
    get 'admin' => 'admin#index'

    # users devise
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

    # users pages
    get 'users/:id/orders' => 'users#orders', as: 'users_orders'
    get 'users/:id/reviews' => 'users#reviews', as: 'users_reviews'

    # other resources
    resources :orders
    resources :line_items
    resources :carts
    resources :products do
      get :who_bought, on: :member
      resources :reviews
    end
  end
end
