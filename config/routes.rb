Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions", confirmations: "users/confirmations",omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "products#landing"
  resources :products, only: [:index, :show] do
    get :search, on: :collection
    post :add_to_cart, on: :member
    post :remove_from_cart, on: :member
    post :adjust_item, on: :member
    get :landing, on: :collection
    get :welcome, on: :collection
  end

  resource :users, only: :show do
    get :edit_member, on: :collection
    get :confirm_password, on: :collection
    post :update_member, on: :collection
    post :confirm, on: :collection
  end

  resource :cart do
    get :order_detail, on: :collection
  end

  post 'spgateway/return'
  post 'spgateway/notify'

  resources :orders do 
    post :checkout_spgateway, on: :member
    get :select_payment, on: :collection
    get :create_order, on: :collection
  end

  resources :categories, only: :show do
    get :man, on: :collection
    get :woman, on: :collection
    get :kid, on: :collection
    get :baby, on: :collection
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :ajion2596dhi do
    root "items#index"
    resources :users
    resources :items do
      get :edit_detail, on: :member
      get :new_man, on: :collection
      get :new_woman, on: :collection
      get :new_kid, on: :collection
      get :new_baby, on: :collection

      resources :products
    end
  end
end
