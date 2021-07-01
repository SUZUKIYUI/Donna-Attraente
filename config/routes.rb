Rails.application.routes.draw do

  #----- TOPページ・ABOUTページ-----
  root to: "homes#top"
  get "homes/about" => "homes#about"
  # --------------------------------


  # -------------デザイン投稿者側----------------
  devise_for :design_contributors, controllers: {
    sessions: "design_contributors/sessions",
    passwords: "design_contributors/passwords",
    registrations: "design_contributors/registrations"
  }

  namespace :design_contributor do
    resources :design_contributors, only: [:show, :edit, :update]
    resources :conpanies, only: [:index, :show]
    resources :posts do
      resource :wants, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
      resources :offers, only: [:edit, :update]
    end
  end
  # -------------------------------------------


  # --------------企業側---------------
  devise_for :companies, controllers: {
    sessions: "companies/sessions",
    passwords: "companies/passwords",
    registrations: "companies/registrations"
  }

  namespace :company do
    resources :companies, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show]
    resources :design_contributors, only: [:show]
    resources :offers, only: [:new, :create]
  end
  # -------------------------------


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
