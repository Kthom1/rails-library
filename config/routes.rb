# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  resource :books, only: [:show]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'members/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
