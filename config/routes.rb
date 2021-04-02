Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :projects do
    resources :snapshots
  end

  resources :home, only: [:index]

 root to: "home#index"
end
