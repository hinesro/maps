Rails.application.routes.draw do
  resources :categories

  resources :listings

  root :to => "base#home"


  devise_for :users, :skip => :registrations, :controllers => {:sessions => 'sessions'}
end
