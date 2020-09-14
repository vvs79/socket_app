Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'chats#index'

  resources :chats
  resources :chat_messages, only: :create

  get '*path' => redirect('/')
end
