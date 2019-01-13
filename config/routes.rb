Rails.application.routes.draw do

  root to: 'store#index', as: 'store'

  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  scope '(:locale)' do
    resources :users
    resources :orders
    resources :line_items
    resources :carts
    get 'store/index'

    resources :products
  end
end
