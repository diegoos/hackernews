# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get :search, path: 'search/(:search_query)', to: 'search#show'
end
