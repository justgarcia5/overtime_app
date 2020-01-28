# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :posts
  devise_for :users, skip: [:registrations]

  root to: 'static#homepage'
end
