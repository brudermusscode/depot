Rails.application.routes.draw do
  resources :support_requests, only: %i[index update]

  scope '(:locale)' do
    get 'admin' => 'admin#index'
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all

    resources :products do
      get :who_bought, on: :member
      resources :reviews
    end
  end
end
