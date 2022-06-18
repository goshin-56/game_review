Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about'

  namespace :public do
    resources :customers
    resources :games do
      resources :reviews
    end
  end

  namespace :admin do
    resources :games
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
