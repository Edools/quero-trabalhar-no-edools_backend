# frozen_string_literal: true

Rails.application.routes.draw do
  resources :students
  resources :courses
  resources :schools
  devise_for :users

  root to: 'schools#index'
end
