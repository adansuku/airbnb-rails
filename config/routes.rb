Rails.application.routes.draw do
  namespace :host do
    resources :listings
    # get 'listings/new'
    # get 'listings/edit'
    # get 'listings/index'
    # get 'listings/show'
  end
  get 'static_pages/home'
  root to: "static_pages#home"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
