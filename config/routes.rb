# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  resource :books, only: [:show]
  resource :reserve_records, only: %i[create update]
  resource :checkout_records, only: %i[create update]
  resource :notifications, only: [:destroy]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'members/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
