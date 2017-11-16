Rails.application.routes.draw do
  resources :articles, only: [:index, :show] do
    resources :reactions, only: [:create] do
      collection do
        patch :react
      end
    end
    collection do
      get :search
    end
  end

  root 'articles#index'
end