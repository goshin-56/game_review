Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about'

  namespace :customers do
    resources :reviews
  end

  namespace :admin do

  end

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  end

  devise_for :customers, skip: [:passwords], controllers: {
        sessions: 'customers/sessions',
        registrations: 'customers/registrations',
      }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
        sessions: 'admin/sessions'
      }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
