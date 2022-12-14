Rails.application.routes.draw do
  get 'bookings/new'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :users do
  resources :offers, except: [:destroy, :edit, :update] do
    resources :bookings, only: [:new, :create, :show, :index, :collection]
  end
  # end
  resources :bookings, only: :destroy
  get "dashboard", to: "pages#dashboard"
end
