# frozen_string_literal: true

Rails.application.routes.draw do
  get 'maps/index'
  resources :topics
	resources :maps, only: %i[index]
	resources :departments, only: %i[index show]
	resources :townships, only: %i[index show]
	resources :stations, only: %i[index show] do
		resources :measurements, only: %i[show]
	end
	resources :pollutants, only: %i[index show]
	resources :chartgraphs
  devise_for :users
  resources :users do
    resource 'dataset_collection', only: %i[show create destroy]
  end
  root to: 'topics#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
