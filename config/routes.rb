# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :topics
  devise_for :users
  resources :users do
    resource 'dataset_collection', only: %i[show create destroy]
  end
  root to: 'topics#index'
  resources :searchs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
