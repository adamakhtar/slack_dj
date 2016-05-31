Rails.application.routes.draw do
  resources :slack_webhooks, only: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  get 'player/test', to: 'player#test'
  get 'player/:id', to: 'player#show', as: :player

  # config/routes.rb
  mount ActionCable.server => "/cable"
end
