require 'page_constraint'

Rails.application.routes.draw do
  root to: 'pages#index'

  namespace :admin do
    resources :pages do
      resources :link_groups, except: %w(show)
      resources :links, except: %w(show)
    end
  end

  get '/:slug', to: 'pages#show', constraints: PageConstraint.new
  get '/:page_slug/:link_slug', to: 'links#show', as: :link
end
