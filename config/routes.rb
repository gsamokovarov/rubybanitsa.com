# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#show"

  resource :fortune, only: :show
  resource :slack, only: :show
  resource :join, only: :show
  resources :events, only: %i[show index]
  resources :jobs, only: %i[new show index] do
    collection do
      resource :slideshow, only: :show, controller: :job_slideshow
    end
  end

  get ":during", to: "events#index", as: :during, constraints: { during: /\d+/ }

  direct(:twitter) { "https://twitter.com/@rubybanitsa" }
  direct(:facebook) { "https://fb.me/rubybanitsa" }
  direct(:youtube) { "https://www.youtube.com/playlist?list=PLdorvCkWvyys-G8zXg1-bCHKULzUX-uyT" }

  namespace :admin do
    root to: "events#index"

    resources :events do
      post :publish
    end
    resources :speakers
    resources :talks
    resources :venues

    resources :jobs do
      post :publish
      post :followup
    end
    resources :companies
    resources :contacts
  end

  direct :admin_location do |loc|
    [:admin, loc.venue]
  end
end
