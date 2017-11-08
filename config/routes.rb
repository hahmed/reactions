Rails.application.routes.draw do
  resource :news, only: [:create]

  get 'welcome' => 'welcome#index'
  root 'welcome#index'
end
