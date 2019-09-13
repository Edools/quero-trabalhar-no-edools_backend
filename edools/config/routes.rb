# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users do
    resources :matriculations
  end

  resources :schools do
    get :active_users
  end

  resources :courses
end
