Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about'

  namespace :public do
    resources :customers, only: [:index,:show]
    resources :games, only: [:index,:show] do
      resources :reviews, only: [:new,:create,:show,:edit,:update,:destroy] do
        resources :comments, only: [:create,:edit,:update,:destroy]
        resources :nices, only: [:create,:destroy]
      end
    end
  end

  namespace :admin do
    resources :games, only: [:index,:create,:show,:edit,:update,:destroy]
  end

  devise_scope :customer do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  devise_for :customers, skip: [:passwords], controllers: {
        sessions: 'public/sessions',
        registrations: 'public/registrations',
      }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
        sessions: 'admin/sessions'
      }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
