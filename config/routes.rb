Rails.application.routes.draw do
  resources :articles, only: [:create, :show]

  get 'welcome' => 'welcome#index'
  root 'welcome#index'
end
