Rails.application.routes.draw do
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end
  resource :cart, controller: "cart", only: [:show, :update, :edit] do
    member do
      post :add_product
      post :remove_product
      get :payment
      get :confirmation
      get :finish
      post :finish
    end
  end
  namespace :admin do
    root to: 'products#index'
    resources :products
    resources :categories
    resources :variants
    resources :orders, only: [:show, :index, :update]
  end

  get 'regulamin', to: "static#terms", as: :terms
  get 'polityka-prywatnosci', to: "static#privacy", as: :privacy
  get 'dostawa', to: "static#shipping", as: :shipping
  get 'o-sklepie', to: "static#about", as: :about

  root to: "products#index"
  resources :products, only: [:show, :index], path: "produkt"
  resources :categories, only: [:show], path: "kategoria"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
