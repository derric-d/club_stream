Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events
  resources :clubs, only: [:create, :new]
  resources :users, only: [:update]

  get "/dashboard", to: "pages#dashboard"

  get "/preferences", to: "pages#preferences"

  get "/whatsapp", to: "pages#whatsapp"

  get "/privacy", to: "pages#privacy"


  get "/tagged", to: "events#tagged", as: :tagged

  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

end
