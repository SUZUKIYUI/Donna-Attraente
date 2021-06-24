Rails.application.routes.draw do
  namespace :company do
    get 'design_contributors/show'
  end
  namespace :company do
    get 'companies/index'
    get 'companies/show'
    get 'companies/edit'
  end
  namespace :company do
    get 'offers/new'
  end
  namespace :company do
    get 'posts/index'
    get 'posts/show'
  end
  get 'homes/top'
  get 'homes/about'
  namespace :design_contributor do
    get 'companies/index'
    get 'companies/show'
  end
  namespace :design_contributor do
    get 'design_contributors/show'
    get 'design_contributors/edit'
  end
  namespace :design_contributor do
    get 'offers/edit'
  end
  namespace :design_contributor do
    get 'posts/index'
    get 'posts/new'
    get 'posts/show'
    get 'posts/edit'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
