require 'page_constraint'

Rails.application.routes.draw do
  root to: 'pages#index'

  namespace :admin do
    resources :pages
  end

  get '/:slug', to: 'pages#show', constraints: PageConstraint.new
end
