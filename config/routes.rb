Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events
  resources :clubs, only: [:create, :new]
  resources :users, only: [:update]

  get "/dashboard", to: "pages#dashboard"

  get "/preferences", to: "pages#preferences"

  get "/whatsapp", to: "pages#whatspp"

  get "/tagged", to: "events#tagged", as: :tagged
end
