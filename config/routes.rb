require 'sidekiq/web'
Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"

Rails.application.routes.draw do
  resources :url, only: [:create, :index]

  mount Sidekiq::Web => '/sidekiq' unless Rails.env.production?
end
