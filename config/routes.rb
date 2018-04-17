Rails.application.routes.draw do
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  devise_for :users
  
  authenticated :user do
    root to: 'conversations#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
end
