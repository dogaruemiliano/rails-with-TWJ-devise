Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :contacts, only: [ :index, :create, :destroy ]
      resources :sessions, only: [ :create, :destroy ]
    end
  end

  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
