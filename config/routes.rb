Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :admins, only: [:show, :edit, :update, :destroy]

  get    '/users/faq',    to: 'users#faq'
  resources :users, only: [:show, :edit, :update, :destroy]

  get    '/cards/:id',    to: 'cards#top', as: 'card_top'
  resources :cards, only: [:create, :edit, :update, :destroy]

  get    '/dams/top',    to: 'dams#top'
  get    '/dams/search',    to: 'dams#search'
  get    '/dams/management',    to: 'dams#management'
  resources :dams, only: [:new, :create, :show, :update, :destroy]

  resources :prefectures, only: [:show]
end
