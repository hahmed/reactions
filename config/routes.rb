Rails.application.routes.draw do
  resources :articles, only: [:create, :show] do
    resources :reactions, only: [:create] do
      collection do
        patch :react
      end
    end
  end

  get 'welcome' => 'welcome#index'
  root 'welcome#index'
end
