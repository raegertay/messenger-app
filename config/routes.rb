Rails.application.routes.draw do
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  devise_for :users
  
  authenticated :user do
    root to: 'users#index', as: :authenticated_root
  end

  get '/user/:user_id/conversation', to: 'conversations#show', as: 'conversation_user'

  root to: redirect('/users/sign_in')
end
