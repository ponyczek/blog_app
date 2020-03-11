Rails.application.routes.draw do
  devise_for :users
  resources :articles
  root "pages#home"

  get '/:page' => 'pages#show'
end
