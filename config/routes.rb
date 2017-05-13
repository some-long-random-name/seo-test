require 'page_constraint'
require 'link_constraint'

Rails.application.routes.draw do
  root to: 'pages#index'

  resource :search, only: %w(show)

  namespace :admin do
    resources :pages do
      resources :link_groups, except: %w(show)
      resources :links, except: %w(show)
    end
  end

  get '/:slug', to: 'pages#show', as: :page, constraints: PageConstraint.new
  get '/:page_slug/:link_slug', to: 'links#show', as: :link, constraints: LinkConstraint.new
end
