# frozen_string_literal: true

Rails.application.routes.draw do
  #get 'map/index'
  #get 'map/show'
  resources :map 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :topics
	resources :chartgraphs
  devise_for :users
  resources :users do
    resource 'dataset_collection', only: %i[show create destroy]
  end
  root to: 'topics#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
