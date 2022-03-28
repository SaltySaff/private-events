Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index'
  resources :events
  resources :users, :only => [:show, :index]
  resources :event_attendings

  post '/users/:user_id/events/:id', to: "attending_events#create", as: "create_attending_event"
  delete '/users/:user_id/events/:id', to: "attending_events#destroy", as: "cancel_attending_event"

  post 'users/:user_id/events/:id', to: "invitations#create", as: "create_invitation"
  delete '/users/:user_id/events/:id', to: "invitations#destroy", as: "cancel_invitation"
end
