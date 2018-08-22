Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions", confirmations: "users/confirmations",omniauth_callbacks: "users/omniauth_callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "products#landing"
  resources :products, only: [:index, :show] do
    post :add_to_cart, on: :member
    get :landing, on: :member
  end

  resource :cart


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :ajion2596dhi do
    root "products#index"
    resources :users
    resources :products
  end
end
