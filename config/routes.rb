Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/help', to: 'static_pages#help'
  get  '/about', to: 'static_pages#about'
  get  '/documents/agreement', to: 'static_pages#agreement'
  
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  devise_for :shops, controllers: {
    sessions:      'shops/sessions',
    passwords:     'shops/passwords',
    registrations: 'shops/registrations'
  }

  # devise_scope :shop do
  #     get 'mypages/shops/profile_edit', to: 'shops/registrations#profile_edit'
  #     patch 'mypages/profile_update', to: 'shops/registrations#profile_update'
  # end

  namespace :admins, shallow: true do
    root 'top#index'
    resources :shops do
      resources :shop_events
    end
    get '/shop_events', to: 'shops#event'
    resources :blogs
    resources :informations
  end

  namespace :shops, shallow: true do
    root 'mypages#index'
    resources :addresses
    resources :details
    resources :menus
    resources :menu_books
    resources :prides
    resources :recommends
    resources :features
    resources :shop_events
  end

  resources :blogs, only: [:index, :show]
  resource :shops, only: [:index] do
    get '/search', to: 'shops#search'
  end
  resources :recommends, only: [:show] 
    resources :features, only: [:show] 
    resources :areas, param: :areacode, path: '/', only: [:show] do
      resources :shops, only: [:show]
    end
      

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
