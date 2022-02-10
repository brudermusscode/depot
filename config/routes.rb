Rails.application.routes.draw do
  resources :products do
    get :who_bought, on: :member
    resources :reviews
  end

  resources :support_requests, only: %i[index update]

  scope '(:locale)' do
    get 'admin' => 'admin#index'
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
  end
end
