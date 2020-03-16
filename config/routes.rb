Rails.application.routes.draw do
  root "pages#home"

  devise_for :users

  patch 'articles/toggle_draft/:id', to: 'articles#toggle_draft', as: 'toggle_draft'
  resources :articles

  get '/:page' => 'pages#show'
end
