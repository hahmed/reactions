Rails.application.routes.draw do
  resources :articles, only: [:create, :show] do
    resources :reactions, only: [:create] do
      collection do
        patch :happy
        patch :lol
        patch :unamused
        patch :fear
        patch :wave
        patch :prayer
        patch :heart
        patch :hooray
        patch :thumbs_up
        patch :thumbs_down
      end
    end
  end

  get 'welcome' => 'welcome#index'
  root 'welcome#index'
end
