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
  resources :users, only: [:index, :show, :edit, :update, :destroy]

  get '/users/:id/cardlist' => 'users#cardlist', as: 'cardlist'

  resources :cards, only: [:show] do
    member do
      get 'get_prefectures' #/cards/:id/get_prefectures
    end
    resources :images, only: [:show]
  end
  resources :cards, only: [:create, :edit, :update, :destroy]

  get    '/dams/top/',    to: 'dams#top'
  get    '/dams/search',    to: 'dams#search'
  get    '/dams/management',    to: 'dams#management'
  resources :dams, only: [:new] do
    collection do
      get 'get_prefectures' #/dams/get_prefectures
    end
  end

  resources :dams, only: [:create, :index, :show, :edit, :update, :destroy]

  resources :prefectures, only: [:show]

  resources :facilities, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  resources :distributes, only: [:create, :index, :destroy]

end
