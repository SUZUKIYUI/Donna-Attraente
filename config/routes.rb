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
    resources :companies, only: [:index, :show]
    resources :notifications, only: :index
    resources :notification2s, only: :index
    resources :posts do
      resource :wants, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
      resources :offers, only: [:edit, :update]
    end
  end

  get "/design_contributor/posts/:post_id/offers/:id" => "design_contributor/offers#edit"
  # -------------------------------------------


  # --------------企業側---------------
  devise_for :companies, controllers: {
    sessions: "companies/sessions",
    passwords: "companies/passwords",
    registrations: "companies/registrations"
  }

  namespace :company do
    resources :companies, only: [:index, :show, :edit, :update]
    resources :design_contributors, only: [:show]
    resources :notifications, only: :index
    resources :posts, only: [:index, :show] do
      resources :offers, only: [:new, :create]
    end
  end
  # -------------------------------


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
