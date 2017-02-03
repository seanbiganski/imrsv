Rails.application.routes.draw do
  resources :projects
  resources :ads
  resources :users

  get 'fetch', to: 'fetch#ad'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#index"

end
