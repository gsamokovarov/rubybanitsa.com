# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#show"

  get "/during/:year/", to: "events#index", as: :events_year

  resource :fortune, only: :show
  resource :slack, only: :show
  resource :join, only: :show
  resources :events, only: %i[show index] do
    member do
      get :banner
    end
  end
  resources :jobs, only: %i[new show index]
  resources :speakers, only: %i[index show]

  direct(:twitter) { "https://twitter.com/@rubybanitsa" }
  direct(:facebook) { "https://fb.me/rubybanitsa" }
  direct(:youtube) { "https://www.youtube.com/playlist?list=PLdorvCkWvyys-G8zXg1-bCHKULzUX-uyT" }
  direct(:neuvents) { "https://neuvents.com" }

  namespace :admin do
    root to: "events#index"

    resources :events do
      post :publish
    end
    resources :sponsorships
    resources :speakers
    resources :talks
    resources :venues

    resources :jobs do
      post :publish
    end
    resources :companies
    resources :contacts
  end
end
