Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  get 'static_pages/about'

  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
