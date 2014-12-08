Rails.application.routes.draw do
  root :to => "base#home"

  resources :categories
  resources :listings

  get 'admin' => 'base#admin'

  devise_for :users, :skip => :registrations, :controllers => {:sessions => 'sessions'}
end
