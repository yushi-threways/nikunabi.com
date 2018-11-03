Rails.application.routes.draw do

  resources :menu_books
  root 'static_pages#home'
  get  '/help', to: 'static_pages#help'
  get  '/about', to: 'static_pages#about'
  get 'search', to: 'shops#search'
  
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  scope 'mypages' do
    devise_for :shops, controllers: {
      sessions:      'shops/sessions',
      passwords:     'shops/passwords',
      registrations: 'shops/registrations'
    }
  end

  devise_scope :shop do
      get 'mypages/shops/profile_edit', to: 'shops/registrations#profile_edit'
      patch 'mypages/profile_update', to: 'shops/registrations#profile_update'
  end

  namespace :admins do
    resource :shops, only: [:index]
    resources :shops
    resource :blogs, only: [:index ]
    resources :blogs
    resource :informations, only: [:index ]
    resources :informations
  end
  namespace :mypages do
    resources :shops, shallow: true do
      resource :addresses, only: [:index, :show ]
      resources :addresses
      resource :details, only: [:index, :show ]
      resources :details
      resource :menus, only: [:index, :show ]
      resources :menus
      resource :menu_books, only: [:index, :show ]
      resources :menu_books
      resource :prides, only: [:index, :show ]
      resources :prides
      resource :recommends, only: [:index, :show ]
      resources :recommends
      resource :features, only: [:index, :show ]
      resources :features
    end
  end
  resource :shops, only: [:index] do
    resources :cities, only: [:show] do
      resources :shops, only: [:show]
    end
  end

  resources :shops, only: [:index]
  resources :admins, only: [:index]
  resources :blogs, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
