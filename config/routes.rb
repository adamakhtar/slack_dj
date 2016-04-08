Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  get 'player', to: 'player#show'
  get 'player/finished', to: 'player#finished'

  # config/routes.rb
  mount ActionCable.server => "/cable"
end
