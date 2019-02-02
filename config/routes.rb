Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get    '/users/faq',    to: 'users#faq'
  resources :users, only: [:show, :edit, :update, :destroy]

  get    '/cards/top',    to: 'cards#top'
  resources :cards, only: [:create, :edit, :update, :destroy]

  get    '/dams/top',    to: 'dams#top'
  get    '/dams/prefecture',    to: 'dams#prefecture'
  get    '/dams/search',    to: 'dams#search'
  resources :dams, only: [:new, :create, :index, :show, :update, :destroy]
end
