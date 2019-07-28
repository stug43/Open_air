# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users 
  resources :topics
	namespace :admin do
		root to: 'topics#index'
  	resources :users, only: [:index, :edit, :update, :destroy]
		resources :topics
	end
  root to: 'topics#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
