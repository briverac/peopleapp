require 'resque/server'

Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'people#index'

  resources :people

  #this route is needed to use the web ui of resque
  mount Resque::Server.new, at: "/resque"

end
