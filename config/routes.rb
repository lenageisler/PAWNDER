Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "pages#home"

  resources :dogs do
    resources :favorites, only: [:create]
  end

  resources :favorites,  only: [:index, :destroy] do
    resources :chats, only: [:create]
  end

  resources :chats, only: [:show]

  resources :preferences, only: [:show, :new, :create, :edit, :update, :destroy]

  resources :ai_chats, only: [:create, :show] do
    resources :ai_messages, only: [:new, :create]
  end

end
