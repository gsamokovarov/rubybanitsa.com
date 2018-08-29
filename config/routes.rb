# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#show"

  resources :events, only: %i[show index]
  resources :jobs, only: %i[new show index]

  direct(:slack) { "https://slack.rubybanitsa.com" }
  direct(:twitter) { "https://twitter.com/@rubybanitsa" }
  direct(:facebook) { "https://fb.me/rubybanitsa" }
  direct(:meetup) { "https://www.meetup.com/Ruby-Banitsa" }

  namespace :admin do
    root to: "events#index"

    resources :events do
      post :publish
    end
    resources :speakers
    resources :talks
    resources :venues

    resources :jobs
    resources :companies
  end

  direct :admin_location do |loc|
    [:admin, loc.venue]
  end
end
